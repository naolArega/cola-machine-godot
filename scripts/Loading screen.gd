extends Control

func goto_game():
	if get_tree().change_scene("res://scenes/Main.tscn") != OK:
		print("Unable to load game!")
