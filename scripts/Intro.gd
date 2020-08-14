extends Control

func open_menu():
	if get_tree().change_scene("res://scenes/Main menu.tscn") != OK:
		print("Unable to load Menu!")

func _ready():
	$ColorRect/CenterContainer/Label/AnimationPlayer.play("fade in and out")
