extends Node2D

@onready var game_over = $CanvasLayer/GameOver

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.start_game()
	# while true:
		# if GameManager.is_game_over:
			# get_tree().paused = true

func show_game_over():
	game_over.show()
	get_tree().paused = true
	
