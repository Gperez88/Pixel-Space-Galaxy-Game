extends "power_up.gd"

func _ready():
	$sprite/animation.play("default")

func _on_Power_Armor_area_entered(area):
	if area.is_in_group("player"):
		area.armor += 1
		queue_free()
