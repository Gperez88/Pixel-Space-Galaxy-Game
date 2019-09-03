extends Area2D

const explosion = preload("../explosion/explosion.tscn")

signal destroyed
export var velocity = Vector2()

export var armor = 1 setget set_armor
export var value = 5

func _ready():
	$sprite/animation.current_animation = "body"

func _process(delta):
	translate(velocity)

func _on_visibility_notifier_screen_exited():
	queue_free()

func _on_Enemy_destroyed():
	create_explosion()
	queue_free()

func create_explosion():
	var e = explosion.instance()
	e.position = position
	utils.main_node.add_child(e)

func set_armor(new_value):
	if is_queued_for_deletion(): return
	
	if new_value < armor: audio_player.player(audio_player.samplers.hit_enemy)
	
	armor = new_value
	$sprite/armor_sprite.frame = armor
		
	if armor <= 0:
		utils._find_node("score_texture").score += value
		create_explosion()
		queue_free()
