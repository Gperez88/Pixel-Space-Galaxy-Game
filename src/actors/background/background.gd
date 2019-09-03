extends Node2D

const height = 240
var velocity = 1
var bound

func _ready():
	bound = get_viewport_rect().size
	
	$background_sprite_one.position.y = height
	$background_sprite_two.position.y = -height

func _process(delta):
	if $background_sprite_one.position.y - (bound.y/2) >= bound.y:
		$background_sprite_one.position.y = -height
	
	if $background_sprite_two.position.y - (bound.y/2) >= bound.y:
		$background_sprite_two.position.y = -height
	
	$background_sprite_one.position.y += velocity
	$background_sprite_two.position.y += velocity
