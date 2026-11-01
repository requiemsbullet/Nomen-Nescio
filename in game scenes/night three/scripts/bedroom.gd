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
	DialogueManager.queue_dialogue("sylvan", "you have become rather familiar with this place")
	DialogueManager.queue_dialogue("maria", "i'm not sure that's a good thing...")
	DialogueManager.queue_dialogue("sylvan", "did i say that it was?")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "you knew i'd come back")
	DialogueManager.queue_dialogue("sylvan", "i knew you we're coming before you knew you could.")
	DialogueManager.queue_dialogue("maria", "you're not very straight forward...")
	DialogueManager.queue_dialogue("sylvan", "do i have to be?")
	DialogueManager.queue_dialogue("maria", "i would like it.")
	DialogueManager.queue_dialogue("sylvan", "...")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "so...")
	DialogueManager.queue_dialogue("maria", "why are you always somewhere different?")
	DialogueManager.queue_dialogue("sylvan", "would you prefer it if i had stayed in the same place?")
	DialogueManager.queue_dialogue("maria", "i would prefer if you were not here at all.")
	DialogueManager.queue_dialogue("sylvan", "understandably so.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "what do you want from me?")
	DialogueManager.queue_dialogue("sylvan", "tonight? very little.")
	DialogueManager.queue_dialogue("maria", "then why am i here? why are you here? why wait for me?")
	DialogueManager.queue_dialogue("sylvan", "perhaps you have something new to learn.")
	DialogueManager.queue_dialogue("maria", "you keep saying that- you tell me stories and expect me to understand what they mean.")
	DialogueManager.queue_dialogue("sylvan", "i don't expect you to understand everything.")
	DialogueManager.queue_dialogue("maria", "then what am i supposed to do?")
	DialogueManager.queue_dialogue("sylvan", "just listen.")
	DialogueManager.queue_dialogue("sylvan","there once was a house, every night someone would hear a sound.")
	DialogueManager.queue_dialogue("maria", "that sounds vaguely familiar...")
	DialogueManager.queue_dialogue("sylvan", "hm. i guess it does, doesn't it?")
	DialogueManager.queue_dialogue("sylvan", "at first it was faint. a whisper from behind walls.")
	DialogueManager.queue_dialogue("sylvan", "a footstep in an empty room, nothing that could really be found by the time morning game.")
	DialogueManager.queue_dialogue("maria", "and... what was making the noise?")
	DialogueManager.queue_dialogue("sylvan", "oh, maria...")
	DialogueManager.queue_dialogue("sylvan", "i feel as if i have told you enough stories by now that you understand that is not the primary take away from this.")
	DialogueManager.queue_dialogue("maria", "hnm... yeah, i guess so... continue.")
	DialogueManager.queue_dialogue("sylvan", "the person who was living there did not know. but the sound grew louder each night.")
	DialogueManager.queue_dialogue("sylvan", "they tried to drown it out with a bell. they rang it whenever the sound would begin.")
	DialogueManager.queue_dialogue("sylvan", "for a while, they could hear nothing else.")
	DialogueManager.queue_dialogue("maria", "and... did it work?")
	DialogueManager.queue_dialogue("sylvan", "over time the bell grew quiet. the sound did not.")
	DialogueManager.queue_dialogue("sylvan", "then, they took a needle and searched the walls for a place where the sound might me hdiing.")
	DialogueManager.queue_dialogue("sylvan", "they pricked the plaster, the curtains, even the little spaces beneath the floorboards to try and find something... anything.")
	DialogueManager.queue_dialogue("maria", "that sounds pretty desperate.")
	DialogueManager.queue_dialogue("sylvan", "would you not be?")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("sylvan", "they were frightened, they wanted something they could point to. something they could remove.")
	DialogueManager.queue_dialogue("sylvan", "but the sound had no body to pierce.")
	DialogueManager.queue_dialogue("maria", "so... what did they do?")
	DialogueManager.queue_dialogue("sylvan", "they found and empty bottle and held it right against the point in the wall where the noise came strongest.")
	DialogueManager.queue_dialogue("sylvan", "when the sound came, they opened the bottle, pressing it to the wall in hopes of catching the sound.")
	DialogueManager.queue_dialogue("maria", "did they catch it?")
	DialogueManager.queue_dialogue("sylvan", "there was no way to be sure it would never return.")
	DialogueManager.queue_dialogue("maria", "but... the noise was gone? they did not hear it again?")
	DialogueManager.queue_dialogue("sylvan", "that they were aware of, yes.")
	DialogueManager.queue_dialogue("maria", "this story feels... oddly straightforward.")
	DialogueManager.queue_dialogue("sylvan", "my words have never been meant to confuse. they are there to tell you what i can.")
	DialogueManager.queue_dialogue("maria", "so... i assume i am meant to choose again.")
	DialogueManager.queue_dialogue("sylvan", "yes, that was the intention.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("sylvan", "take your time, maria. some things may be much easier to carry than others.")
	DialogueManager.queue_dialogue("sylvan", "so what will it be, maria?
	0.1 the bell
	0.2 the needle
	0.3 the bottle")
	

func _on_dialogue_finished() -> void:
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/choices/brchoicemenu.tscn")
