extends CharacterBody2D


const SPEED = 1000.0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.get_action_strength("player_move_left"):
		velocity.x = -SPEED
	elif Input.get_action_strength("player_move_right"):
		velocity.x = SPEED
	else:
		velocity.x = 0

	move_and_slide()
