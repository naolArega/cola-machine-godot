extends Spatial

export var mouse_sensetivity := 0.5
var mouse_position :Vector2
var min_radian = -10
var max_radian = 10
var pan = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if !pan:
			pan = true
		if pan and !event.is_pressed():
			pan = false
	if event is InputEventMouseMotion and pan:
		event.relative *= mouse_sensetivity
		mouse_position.x = clamp(event.relative.x + mouse_position.x, min_radian, max_radian)
		mouse_position.y = clamp(event.relative.y + mouse_position.y, min_radian, max_radian)
		rotation.y = deg2rad(-mouse_position.x)
		rotation.x = deg2rad(-mouse_position.y)
