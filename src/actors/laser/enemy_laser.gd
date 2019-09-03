extends "laser.gd"

func _on_Enemy_Laser_area_entered(area):
	if area.is_in_group("player"):
		area.armor -= 1
		utils.remote_call("camera", "shake", 3, 0.13)
		queue_free()
