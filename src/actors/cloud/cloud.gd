extends Node2D

var velocity = 1

func _ready():
	velocity = rand_range(1, 2)


func _process(delta):
	position.y += velocity

func _on_visibility_notifier_screen_exited():
	queue_free()
