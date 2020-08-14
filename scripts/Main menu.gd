extends MarginContainer

func _ready():
	pass

func quit_game():
	get_tree().quit()

func _on_Play_pressed():
	if get_tree().change_scene("res://scenes/Loading screen.tscn") != OK:
		print("Unable to load Loading screen!")


func _on_Exit_pressed():
	$AnimationPlayer.play("Fade_out")
