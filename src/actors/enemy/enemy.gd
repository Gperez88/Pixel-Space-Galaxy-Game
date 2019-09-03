extends Area2D

signal destroyed

enum ENEMY_STATUS {destroyed, alive}

export var velocity = Vector2()
var current_status = ENEMY_STATUS.alive

func _process(delta):
	translate(velocity)

func _on_visibility_notifier_screen_exited():
	queue_free()

func _on_Enemy_destroyed():
	current_status = ENEMY_STATUS.destroyed
	$sprite/animation.current_animation = "explosion"
	$explosion_particle.emitting = true
	$collision.call_deferred("set", "disabled", true)
