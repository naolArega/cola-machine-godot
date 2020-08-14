extends MarginContainer

func _ready():
	get_tree().set_auto_accept_quit(false)

func _on_Continue_pressed():
	visible = false

func _on_Exit_pressed():
	$AcceptDialog.show()

func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		$AcceptDialog.show()


func _on_AcceptDialog_confirmed():
	get_tree().quit()
