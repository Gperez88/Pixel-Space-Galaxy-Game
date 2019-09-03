extends RigidBody2D

signal destroyed
export (PackedScene) var laser

enum ENEMY_STATUS {destroyed, alive}

var current_status = ENEMY_STATUS.alive
var type = 1

func _ready():
	$collision.position = $sprite.position
	$explosion_particle.position = $sprite.position
	
	match(type):
		1:
			$sprite/animation.current_animation = "small"
			$collision.scale.x = 1
			$collision.scale.y = 1
		2:
			$sprite/animation.current_animation = "medium"
			$collision.scale.x = 1.8
			$collision.scale.y = 1
		3:
			$sprite/animation.current_animation = "big"
			$collision.scale.x = 1.5
			$collision.scale.y = 1.5
			$collision.position.y += 4.55


func _on_visibility_notifier_screen_exited():
	queue_free()


func _on_Enemy_destroyed():
	current_status = ENEMY_STATUS.destroyed
	$sprite/animation.current_animation = "explosion"
	$explosion_particle.emitting = true
	$collision.call_deferred("set", "disabled", true)


func _on_laser_timer_timeout():
	create_laser()


func create_laser():
	if current_status == ENEMY_STATUS.destroyed:
		return
	
	var l = laser.instance()
	l.reference = self
	l.velocity = -2
	l.type = 2
	add_child(l)
	
	var laser_begin_position = Vector2($sprite.position.x-2, $sprite.position.y-6)
	l.position = laser_begin_position
