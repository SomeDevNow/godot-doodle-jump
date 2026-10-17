extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 600.0
const DRAG = 0.1

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Player Left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("Player Right"):
		velocity.x = SPEED
	else:
		velocity.x *= DRAG
		if abs(velocity.x) < 10:
			velocity.x = 0 
	
	velocity.y += GRAVITY * delta
	
	move_and_slide()
