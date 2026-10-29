
extends CanvasLayer

@onready var spot1: MarginContainer = $inventorycontainer1
@onready var spot2: MarginContainer = $inventorycontainer2
@onready var spot3: MarginContainer = $inventorycontainer3
@onready var spot4: MarginContainer = $inventorycontainer4
@onready var spot5: MarginContainer = $inventorycontainer5
@onready var spot6: MarginContainer = $inventorycontainer6


func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory") and not event.is_echo():
		visible = not visible
		get_tree().paused = visible
		get_viewport().set_input_as_handled()
