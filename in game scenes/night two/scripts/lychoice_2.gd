extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i guess the mirror could be useful...")
	DialogueManager.queue_dialogue("sylvan", "to... see yourself?")
	DialogueManager.queue_dialogue("maria", "to see around me. to see what is hidden.")
	DialogueManager.queue_dialogue("sylvan", "and if you do find something, what will you do when you see it?")
	DialogueManager.queue_dialogue("maria", "i'm not sure... but at least i will know it's there.")
	DialogueManager.queue_dialogue("sylvan", "knowing something is there can be a terrible burden.")
	DialogueManager.queue_dialogue("maria", "you make it sound like i should be adraid of looking.")
	DialogueManager.queue_dialogue("sylvan", "well, i wouldn't ask you to look away.")
	DialogueManager.queue_dialogue("maria", "there's something wrong with this mirror...")
	DialogueManager.queue_dialogue("sylvan", "there is something wrong with many things in this house.")
	DialogueManager.queue_dialogue("maria", "including you?")
	DialogueManager.queue_dialogue("sylvan", "...")
	DialogueManager.queue_dialogue("sylvan", "perhaps it will show you something you need to see.")
	DialogueManager.queue_dialogue("maria", "perhaps?")
	DialogueManager.queue_dialogue("sylvan", "a reflection can show you a door. it cannot open it.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/opening.tscn")
