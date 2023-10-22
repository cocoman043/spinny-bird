extends StaticBody2D
signal add_point
@export var PIPE_SPEED: float;

# Called when the node enters the scene tree for the first time.
func _ready():
	translate(Vector2(0,randf_range(-200.0, 200.0)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(-PIPE_SPEED * delta, 0))
	if position.x < -500:
		position.x = 1363
		position.y = 0
		translate(Vector2(0,randf_range(-200.0, 200.0)))



func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	emit_signal("add_point")
