extends Area2D

var velocity = 10

func _process(delta):
	position.y -= velocity


func _on_visibility_notifier_screen_exited():
	queue_free()


func _on_Laser_body_entered(body):
	body.emit_signal("destroyed")
