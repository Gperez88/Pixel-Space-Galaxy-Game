extends Node

const enemies = [
	preload("res://src/actors/enemy/kamikaze_enemy.tscn"),
	preload("res://src/actors/enemy/clever_enemy.tscn"),
	preload("res://src/actors/enemy/big_clever_enemy.tscn")
]

func _ready():
	spawn()

func spawn():
	while true:
		randomize()
		
		var enemy = utils.choose(enemies).instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, utils.view_size.x-16)
		pos.y = 0-16
		
		enemy.position = pos
		get_node("container").add_child(enemy)
		yield(utils.create_timer(rand_range(0.5,1.25)), "timeout")
