extends Sprite

func _ready():
	utils.attach("player", "armor_changed", self, "_on_armor_changed")

func _on_armor_changed(armor):
	frame = armor
