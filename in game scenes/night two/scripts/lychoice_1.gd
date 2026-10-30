extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i will take the key.")
	DialogueManager.queue_dialogue("sylvan", "something that opens and locks.")
	DialogueManager.queue_dialogue("maria", "yeah thats... generally what keys are for.")
	DialogueManager.queue_dialogue("sylvan", "and yet so many doors remain unexplored.")
	DialogueManager.queue_dialogue("maria", "i guess i will have to find out what this one opens.")
	DialogueManager.queue_dialogue("sylvan", "or closes.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "do you know what it belongs to?")
	DialogueManager.queue_dialogue("sylvan", "i know what it can do.")
	DialogueManager.queue_dialogue("maria", "that's not the same thing...")
	DialogueManager.queue_dialogue("sylvan", "...")
	DialogueManager.queue_dialogue("sylvan", "remember, maria. opening a door is not the same as knowing what is on the other side.")
	DialogueManager.queue_dialogue("sylvan", "locking is a constant. a promise.")
	DialogueManager.queue_dialogue("maria", "you really enjoy making things difficult.")
	DialogueManager.queue_dialogue("sylvan", "only when you insist on making them simple.")
	DialogueManager.queue_dialogue("sylvan", "keep it safe. you may find yourself making use of it sooner than you would expect.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/choices/lychoicemenu.tscn")
