extends Node


var points:int = 0

var is_game_over: bool = false
var point_label

signal game_over
signal restart

# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_game() -> void:
	point_label = get_tree().current_scene.get_node("Bird").get_child(4).get_child(0)
	point_label.text = str(points)
	is_game_over = false
	points = 0
	game_loop()

func update_points() -> void:
	point_label.text = str(points)
	
func game_loop() -> void:
	while true:
		if is_game_over:
			print("yes")
			# get_tree().current_scene.get_node("GameOverNa").get_child(0).show()
			await restart
			is_game_over = false
		else:
			await game_over
			continue

# func restart():
	# points = 0
	# update_points()
	# get_tree().current_scene.change_scene_to_file("res://world.tscn")
