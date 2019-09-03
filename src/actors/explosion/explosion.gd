extends Sprite

func _ready():
	$smoke_particle.emitting = true
	$flare_particle.emitting = true
	
	utils.remote_call("camera", "shake", 8, 0.2)
	audio_player.player(audio_player.samplers.explosion)
	
	$animation.play("fade_out")
	yield($animation, "animation_finished")
	queue_free()
