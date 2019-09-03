extends "enemy.gd"

const laser = preload("../laser/enemy_laser.tscn")

func _ready():
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
	if current_status == ENEMY_STATUS.destroyed:
		return
	
	var l = laser.instance()
	add_child(l)
	
	l.position = $cannon/laser_position.position