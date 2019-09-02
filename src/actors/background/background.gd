extends Node2D

var velocity = 1
var bound

func _ready():
	bound = get_viewport_rect().size
	
	$background_sprite_one.position.y = 304
	$background_sprite_two.position.y = -304


func _process(delta):
	if $background_sprite_one.position.y - (bound.y/2) >= bound.y:
		$background_sprite_one.position.y = -304
	
	if $background_sprite_two.position.y - (bound.y/2) >= bound.y:
		$background_sprite_two.position.y = -304
	
	$background_sprite_one.position.y += velocity
	$background_sprite_two.position.y += velocity
