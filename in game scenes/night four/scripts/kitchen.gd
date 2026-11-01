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
	DialogueManager.queue_dialogue("sylvan", "four nights now, maria.")
	DialogueManager.queue_dialogue("maria", "you have been counting...")
	DialogueManager.queue_dialogue("sylvan", "so have you, i'd imagine.")
	DialogueManager.queue_dialogue("maria", "yeah... i guess so.")
	DialogueManager.queue_dialogue("maria", "i don't want to think about how many more there could be.")
	DialogueManager.queue_dialogue("sylvan", "then perhaps you should not ask.")
	DialogueManager.queue_dialogue("maria", "you always do that...")
	DialogueManager.queue_dialogue("sylvan", "do what?")
	DialogueManager.queue_dialogue("maria", "answer a question without really answering it.")
	DialogueManager.queue_dialogue("sylvan", "some questions have answers that are not yet yours to hear.")
	DialogueManager.queue_dialogue("maria", "and who decides that?")
	DialogueManager.queue_dialogue("sylvan", "you will, soon enough.")
	DialogueManager.queue_dialogue("maria", "... i see you have more... items")
	DialogueManager.queue_dialogue("maria", "is it another story?")
	DialogueManager.queue_dialogue("sylvan", "the last one.")
	DialogueManager.queue_dialogue("maria", "the last one?")
	DialogueManager.queue_dialogue("sylvan", "there are only so many ways to tell the same thing.")
	DialogueManager.queue_dialogue("maria", "so... then, for the last time... tell me.")
	DialogueManager.queue_dialogue("sylvan", "hm... i'm glad you are willing to listen.")
	DialogueManager.queue_dialogue("sylvan", "there was once a village, a vast group. though there was one woman in which every resident had began to forget her name.")
	DialogueManager.queue_dialogue("sylvan", "at first, it was small things. one person remembered a face, another a voice.")
	DialogueManager.queue_dialogue("sylvan", "some could conjure a name, but were not sure that it had belonged to her, or that it had ever belonged to anyone.")
	DialogueManager.queue_dialogue("maria", "and who was the person?")
	DialogueManager.queue_dialogue("sylvan", "that is something many disagreed about.")
	DialogueManager.queue_dialogue("sylvan", "some had said the woman had been kind. others remembered her as cruel. a few insisted she had never existed at all.")
	DialogueManager.queue_dialogue("maria", "but someone must have known the truth, right?")
	DialogueManager.queue_dialogue("sylvan", "they thought so too.")
	DialogueManager.queue_dialogue("sylvan", "one person kept a clock beside their bed. they believed that if they waited long enough the memories would settle.")
	DialogueManager.queue_dialogue("sylvan", "that time could possibly return everything to its right place.")
	DialogueManager.queue_dialogue("sylvan", "and yet, the clock continued to turn, the memories continued to change.")
	DialogueManager.queue_dialogue("sylvan", "another person wore a mask. they thought that if nobody could recognise them, nobodoy could remember what had happened.")
	DialogueManager.queue_dialogue("sylvan", "not that they remembered much in the first place...")
	DialogueManager.queue_dialogue("sylvan", "yet, they continued to hide their face when the subject was mentioned. that woman no one could place an identity on.")
	DialogueManager.queue_dialogue("sylvan", "the village forgot the face of the individual, but did not forget their feelings even behind the mask.")
	DialogueManager.queue_dialogue("sylvan", "but one person began writing everything down long before the incident.")
	DialogueManager.queue_dialogue("sylvan", "long before the woman came to.")
	DialogueManager.queue_dialogue("sylvan", "every detail they could agree upon, they wrote down what was known, what was remembered and what was not.")
	DialogueManager.queue_dialogue("sylvan", "the paper did not make everyone /remember/ the same thing. nor had it restored what was lost.")
	DialogueManager.queue_dialogue("sylvan", "but... it gave them something they could return to. something that did not change simply because someone remembered it differently.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "you keep... talking about remembering. is that what this is all about? am i supposed to know something more than what i do now?")
	DialogueManager.queue_dialogue("sylvan", "what else do you think it is about?")
	DialogueManager.queue_dialogue("maria", "i'm... i don't know. that's why i keep asking you. you're the one with the stories.")
	DialogueManager.queue_dialogue("sylvan", "then perhaps you should consider keeping your own record. to ensure you can keep your thoughts.")
	
	

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroomc.tscn")
