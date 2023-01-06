extends "res://Script/KinematicBody2D.gd"

var stands = true
var destination = Vector2()
var velocityy = Vector2()
var prev_pos = Vector2()
var target = null


func _process(delta):
	if velocityy:
		prev_pos = position
		move_and_slide(velocityy)
		position.x = clamp(position.x, 0 ,10000)
		position.y = clamp(position.y, 0 ,10000)
	wander()
	serch_for_target()
func set_destination(dest):
	destination = dest
	velocityy = (destination - position).normalized() * speed
	stands = false
	
func serch_for_target():
	var pl = get_parent().get_parent().get_parent().get_Player()
	if position.distance_to(pl) < 200:
		cancel_novement()
		target = pl
		
	else:
		if target:
			cancel_novement()
			target = null
		if target: 
			set_destination(target.position)
		
	
func cancel_novement():
	velocityy = Vector2()
	destination = Vector2()
	$StandingTimer.start(2)
	
	
func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(rand_range(pos.x - 150, pos.x + 150))
		var y = int(rand_range(pos.y - 150, pos.y + 150))
		x = clamp(x, 0, 10000)
		y = clamp(y, 0, 10000)
		
		set_destination(Vector2(x,y))
		
	elif velocityy != Vector2():
		if pos.distance_to(destination) <= speed:
			cancel_novement()
			
		elif pos.distance_to(prev_pos) <= 0.6:
			cancel_novement()
		

func _on_StandingTimer_timeout():
	stands = true
	pass
