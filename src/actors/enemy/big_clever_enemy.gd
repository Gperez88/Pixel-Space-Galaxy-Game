extends "enemy.gd"

const laser = preload("../laser/big_enemy_laser.tscn")

func _ready():
	$sprite/animation.current_animation = "body"
	velocity.x = utils.choose([velocity.x, -velocity.x])

func _process(delta):
	# bouncing on the edges
	if position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if position.x >=  utils.view_size.x-16:
		velocity.x = -abs(velocity.x)

func _on_laser_timer_timeout():
	create_laser()

func create_laser():
	var l = laser.instance()
	l.position = position
	l.position.y += 16
	utils.main_node.add_child(l)