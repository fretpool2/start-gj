extends KinematicBody2D

const GRAVITY = 970
const speed = 120
const JUMP_POWER = 500
const FLOOR = (Vector2(0, -1))

var velocity = Vector2()

func _physics_process(delta: float) -> void:
	velocity.y += delta * GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
