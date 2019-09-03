extends "laser.gd"

func _ready():
	audio_player.player(audio_player.samplers.laser_ship)

func _on_Player_Laser_area_entered(area):
	if area.is_in_group("enemy"):
		area.armor -= 1
		utils.remote_call("camera", "shake", 1, 0.13)
		queue_free()