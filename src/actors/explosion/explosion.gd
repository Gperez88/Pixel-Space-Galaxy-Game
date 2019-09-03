extends Sprite

func _ready():
	$smoke_particle.emitting = true
	$flare_particle.emitting = true
	
	utils.remote_call("camera", "shake", 8, 0.2)
	
	$animation.play("fade_out")
	yield($animation, "animation_finished")
	queue_free()
