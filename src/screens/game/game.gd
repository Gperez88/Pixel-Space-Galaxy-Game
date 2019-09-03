extends Node

export (PackedScene) var cloud

func _ready():
	randomize() #generate random patters
	new_game()

func _on_cloud_timer_timeout():
	create_cloud()

func create_cloud():
	var c = cloud.instance()
	c.z_index = 0 if bool(randi() % 2) else 1
	add_child(c)

func new_game():
	$player.start($player_position.position)
	$player.set_process_input(true)
	$cloud_timer.start()

