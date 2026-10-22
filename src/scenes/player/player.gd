extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = 500.0
const GRAVITY = 600.0
const DRAG = 0.1
var jump: bool = false

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Player Left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("Player Right"):
		velocity.x = SPEED
	else:
		velocity.x *= DRAG
		if abs(velocity.x) < 10:
			velocity.x = 0 
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = -JUMP_VELOCITY
	
	move_and_slide()
