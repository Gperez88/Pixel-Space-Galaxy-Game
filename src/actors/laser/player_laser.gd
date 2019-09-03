extends "laser.gd"

func _on_Player_Laser_area_entered(area):
	area.emit_signal("destroyed")
