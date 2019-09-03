extends Area2D

export var velocity = Vector2()

func _process(delta):
	translate(velocity * delta)

func _on_visibility_notifier_screen_exited():
	queue_free()
