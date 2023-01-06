extends StaticBody2D


func _ready():
	randomize()
	var gr = int(rand_range(1,5))
	$Sprite.texture = load( "res://Sprite/ground/ground%s.png" % str(gr))
	pass 
	
