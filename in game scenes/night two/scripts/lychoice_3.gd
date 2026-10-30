extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i will take the photograph.")
	DialogueManager.queue_dialogue("sylvan", "a memory.")
	DialogueManager.queue_dialogue("maria", "it's a photograph.")
	DialogueManager.queue_dialogue("sylvan", "is there a difference?")
	DialogueManager.queue_dialogue("maria", "photographs are real. they show what actually happened.")
	DialogueManager.queue_dialogue("maria", "a memory can lie.")
	DialogueManager.queue_dialogue("sylvan", "it only shows what happened the moment it was taken.")
	DialogueManager.queue_dialogue("maria", "is that not enough?")
	DialogueManager.queue_dialogue("sylvan", "sometimes.")
	DialogueManager.queue_dialogue("sylvan", "but, a moment can not tell you what came before it.")
	DialogueManager.queue_dialogue("sylvan", "nor can it tell you what came after.")
	DialogueManager.queue_dialogue("maria", "sylvan...")
	DialogueManager.queue_dialogue("maria", "the photo. do you recognize the scene?")
	DialogueManager.queue_dialogue("sylvan", "i recognize the feeling of having seen it before. deja vu.")
	DialogueManager.queue_dialogue("maria", "that's not an answer...")
	DialogueManager.queue_dialogue("sylvan", "hm. you say that a lot.")
	DialogueManager.queue_dialogue("sylvan", "yet, you are right. it is not an answer.")
	DialogueManager.queue_dialogue("sylvan", "yet it is all i can give you.")
	DialogueManager.queue_dialogue("sylvan", "hold on to what you remember, maria.")
	DialogueManager.queue_dialogue("sylvan", "just do not mistake it for what still remains.") 
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/opening.tscn")
