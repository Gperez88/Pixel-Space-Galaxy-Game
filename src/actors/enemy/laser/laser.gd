extends Area2D

var velocity = 5

func _process(delta):
	position.y += velocity


func _on_visibility_notifier_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	area.emit_signal("destroyed")
