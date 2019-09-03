extends "enemy_laser.gd"

func _ready():
	$sprite/animation.play("enemy_laser")
	
func _process(delta):
	var player = utils._find_node("player")
	
	if is_instance_valid(player):
		var x_direction = player.position.x - position.x
		var move = Vector2(x_direction, velocity.y)
		position += move * delta
		