extends Area2D

var velocity = 10
var type = 1
var reference # body or area parent.

func _ready():
	match(type):
		1:
			$sprite/animation.current_animation = "player_laser"
			$collision.position.x = 1.5
			$collision.position.y = -2.5
		2:
			$sprite/animation.current_animation = "enemy_laser"
			$collision.position.x = 1.5
			$collision.position.y = 2.5


func _process(delta):
	position.y -= velocity


func _on_visibility_notifier_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	if area != reference:
		area.emit_signal("destroyed")


func _on_Laser_body_entered(body):
	if body != reference:
		body.emit_signal("destroyed")
