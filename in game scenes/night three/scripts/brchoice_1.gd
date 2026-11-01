extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "the bell. maybe if i am able to drown it out, i won't have to hear it anymore")
	DialogueManager.queue_dialogue("sylvan", "hm. you may find some comfort in that.")
	DialogueManager.queue_dialogue("maria", "but it won't make the sound disappear.")
	DialogueManager.queue_dialogue("sylvan", "no. silence and absence are not inherently the same thing.")
	DialogueManager.queue_dialogue("maria", "then... why did the person use it at all?")
	DialogueManager.queue_dialogue("sylvan", "why did you pick it?")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("sylvan", "be careful what you mistake for peace, maria.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/placeholderending.tscn")
