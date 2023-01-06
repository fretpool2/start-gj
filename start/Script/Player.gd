extends "res://Script/KinematicBody2D.gd"

func _physics_process(delta: float) -> void:	
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x =  speed
	elif Input.is_action_pressed("jump") && is_on_floor() or is_on_wall():
		velocity.y =  -JUMP_POWER
	else:
		velocity.x = 0

	velocity = move_and_slide(velocity, FLOOR)
