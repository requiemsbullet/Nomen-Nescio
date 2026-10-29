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
	DialogueManager.queue_dialogue("maria", "it's much colder than i remember.")
	DialogueManager.queue_dialogue("maria", "i know these rooms. this house.")
	DialogueManager.queue_dialogue("maria", "i know which floorboards creak and which doors stick.")
	DialogueManager.queue_dialogue("maria", "i've walked through this house so many times i should be confident i could do it with my eyes closed.")
	DialogueManager.queue_dialogue("maria", "though, i can't trust much with the changes anymore.")
	DialogueManager.queue_dialogue("maria", "sometimes i worry i will approach a familiar door, go through one hall and end up somewhere new- somewhere wrong.")
	DialogueManager.queue_dialogue("maria", "everytime i come back something is just... wrong.")
	DialogueManager.queue_dialogue("maria", "it's like a childhood memory- you can picture it perfectly, but when you return you realise things.. the rooms were smaller, the ceilings were lower...")
	DialogueManager.queue_dialogue("maria", "except, this house is the opposite.")
	DialogueManager.queue_dialogue("maria", "the longer i know it, the more recent the visit, the less i understand it.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "today, it's too quiet. it's too cold.")
	DialogueManager.queue_dialogue("maria", "it's waiting for me.")
	DialogueManager.queue_dialogue("maria", "where should i explore first?
	0.1 . the kitchen
	0.2 . the bathroom
	0.3 . the bedroom")
	
func _on_dialogue_finished() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/clivingroomc.tscn")
