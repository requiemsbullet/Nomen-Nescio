extends CanvasLayer

signal dialogue_finished
var text_queue = []
var current_dialogue = {}
var is_reading = false
var waiting_for_click = false
var text_speed = 0.05
var tween = null

@onready var tbc = $textboxcontainer
@onready var start = $textboxcontainer/MarginContainer/HBoxContainer/Label
@onready var tb = $textboxcontainer/MarginContainer/HBoxContainer/Label2
@onready var end = $textboxcontainer/MarginContainer/HBoxContainer/Label3
@onready var namebox = $nameboxcontainer
@onready var namel = $nameboxcontainer/MarginContainer/HBoxContainer/Label2

func _ready() -> void:
	hide_textbox()

func _process(_delta: float) -> void:
	if not is_reading and not waiting_for_click:
		if text_queue.size() > 0:
			display_text()
	
	if is_reading:
		if Input.is_action_just_pressed("ui_accept"):
			if tween:
				tween.kill()
			tb.visible_ratio = 1.0
			end.text = "v"
			is_reading = false
			waiting_for_click = true
	
	elif waiting_for_click:
		if Input.is_action_just_pressed("ui_accept"):
			waiting_for_click = false
			if text_queue.size() > 0:
				display_text()
			else:
				hide_textbox()
				print("DEBUG: DialogueManager successfully emitting dialogue_finished!")
				dialogue_finished.emit()

func queue_dialogue(speaker: String, text: String) -> void:
	text_queue.append({"speaker": speaker, "text": text})

func play_dialogue(dialogue_list: Array[Dictionary]) -> void:
	for line in dialogue_list:
		text_queue.append(line)

func hide_textbox() -> void:
	if tween:
		tween.kill()
	
	start.text = ""
	end.text = ""
	tb.text = ""
	namel.text = ""
	tbc.hide()
	namebox.hide()
	
	if has_node("choiceboxcontainer1"):
		$choiceboxcontainer1.hide()
	if has_node("choiceboxcontainer2"):
		$choiceboxcontainer2.hide()
	if has_node("choiceboxcontainer3"):
		$choiceboxcontainer3.hide()

func show_textbox() -> void:
	start.text = "*"
	tbc.show()
	namebox.show()

func display_text() -> void:
	if tween:
		tween.kill()
		
	end.text = ""
	current_dialogue = text_queue.pop_front()
	
	namel.text = current_dialogue["speaker"]
	tb.text = current_dialogue["text"]
	
	tb.visible_ratio = 0.0
	is_reading = true
	show_textbox()
	
	var text_length = current_dialogue["text"].length()
	var total_time = text_length * text_speed
	
	tween = create_tween()
	tween.tween_property(tb, "visible_ratio", 1.0, total_time)
	tween.finished.connect(_on_tween_finished)

func _on_tween_finished() -> void:
	if is_reading:
		end.text = "v"
		is_reading = false
		waiting_for_click = true
