extends "power_up.gd"

func _ready():
	$sprite/animation.play("default")

func _on_Power_Laser_area_entered(area):
	if area.is_in_group("player"):
		area.is_laser_updated = true
		queue_free()
