extends "laser.gd"

func _ready():
	audio_player.player(audio_player.samplers.laser_enemy)

func _on_Enemy_Laser_area_entered(area):
	if area.is_in_group("player"):
		area.armor -= 1
		utils.remote_call("camera", "shake", 3, 0.13)
		queue_free()
