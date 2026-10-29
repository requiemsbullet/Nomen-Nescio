extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 1.0

	await get_tree().process_frame
	await fade.fade(0.0, 0.5).finished

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i don't like this room really.")
	DialogueManager.queue_dialogue("maria", "i mean... the reason is silly, really. it just feels wrong.")
	DialogueManager.queue_dialogue("maria", "it's only a bed, some other furniture... just another thing in a house that doesn't exist.")
	DialogueManager.queue_dialogue("maria", "still... i feel like someone's been sleeping here.")
	DialogueManager.queue_dialogue("maria", "who am i kidding, thats a ridiculous idea.")
	DialogueManager.queue_dialogue("maria", "it's just a dream of course all the details are ridiculous.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "i think i've seen enough.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/clivingroomc.tscn")
