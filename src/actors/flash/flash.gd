extends Sprite

func _ready():
	$animation.play("fade_out")
	yield($animation, "animation_finished")
	queue_free()
