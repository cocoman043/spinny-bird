extends CharacterBody2D
@onready var label = $Control/Label
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	rotate(velocity.y * delta * 0.02)
	clamp(rotation_degrees, -90, 90)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 0 and animated_sprite_2d.animation_finished:
			animated_sprite_2d.play("default")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		var timer = Timer.new()
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("fly")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	
	GameManager.is_game_over = true
	GameManager.points = 0
	GameManager.update_points()
	GameManager.game_over.emit()
	get_tree().change_scene_to_file("res://world.tscn")
