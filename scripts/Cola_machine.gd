extends StaticBody

var cola = preload("res://objects/Cola.tscn")
var water = preload("res://objects/Water.tscn")
var beer = preload("res://objects/Beer.tscn")
var beverage_served
var finished_serving = true

func serve_beverage(type :String, input_event):
	if input_event is InputEventMouseButton and input_event.button_index == BUTTON_LEFT and finished_serving:
		match type:
			"Cola":
				beverage_served = cola.instance()
			"Water":
				beverage_served = water.instance()
			"Beer":
				beverage_served = beer.instance()
		finished_serving = false
		$Beverage_spawn.add_child(beverage_served) 
		$Beverage_spawn/AnimationPlayer.play("beverage_spawn")
		$Beverage_life_time.start()

func remove_beverage():
	for beverage in $Beverage_spawn.get_children():
		if beverage.get_index() != 0:
			beverage.queue_free()

func _on_Cola_area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	serve_beverage("Cola", event)


func _on_Water_area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	serve_beverage("Water", event)


func _on_Beer_area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	serve_beverage("Beer", event)


func _on_Beverage_life_time_timeout():
	remove_beverage()
	finished_serving = true
	$Beverage_life_time.stop()
