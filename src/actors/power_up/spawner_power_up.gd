extends Node

const power_ups = [
	preload("res://src/actors/power_up/power_up_armor.tscn"),
	preload("res://src/actors/power_up/power_up_laser.tscn")
]

func _ready():
	yield(utils.create_timer(rand_range(10, 15)), "timeout")
	spawn()

func spawn():
	while true:
		randomize()
		
		var power_up = utils.choose(power_ups).instance()
		var pos = Vector2()
		pos.x = rand_range(0+7, utils.view_size.x-7)
		pos.y = 0-7
		
		power_up.position = pos
		get_node("container").add_child(power_up)
		yield(utils.create_timer(rand_range(10, 15)), "timeout")
