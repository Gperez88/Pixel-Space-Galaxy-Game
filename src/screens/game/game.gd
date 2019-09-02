extends Node

export (PackedScene) var cloud
export (PackedScene) var enemy

const ENEMY_TYPE = [1, 2, 3]

func _ready():
	randomize() #generate random patters
	new_game()


func _input(event):
	if event is InputEventScreenDrag:
		$player.move += event.relative
		
		$player.position += $player.move
		$player.process_animation()


func _on_cloud_timer_timeout():
	create_cloud()


func _on_enemy_timer_timeout():
	create_enemy()

func create_cloud():
	var c = cloud.instance()
	c.z_index = 0 if bool(randi() % 2) else 1
	add_child(c)


func new_game():
	$player.start($player_position.position)
	$player.set_process_input(true)
	$cloud_timer.start()
	$enemy_timer.start()

func create_enemy():
	$enemy_path/enemy_path_follow.offset = randi() #position start enemy
	
	var e = enemy.instance()
	e.type = ENEMY_TYPE[randi() % ENEMY_TYPE.size()]
	add_child(e)
	
	var d = $enemy_path/enemy_path_follow.rotation + PI /2 #direction
	
	e.position = $enemy_path/enemy_path_follow.position
	
	d += rand_range(-PI /4, PI /4)
	e.linear_velocity = Vector2(150, 0).rotated(d)
