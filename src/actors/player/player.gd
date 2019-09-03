extends Area2D

const laser = preload("../laser/player_laser.tscn")
const explosion = preload("../explosion/explosion.tscn")
const flash = preload("../flash/flash.tscn")

signal armor_changed
signal destroyed
export (int) var velocity

var armor = 4 setget set_armor
var move = Vector2()
var bound

func _ready():
	hide()
	bound = get_viewport_rect().size

func _process(delta):
	move = Vector2() #reset move
	
	if Input.is_action_pressed("ui_right"): #move right
		move.x += 1
	if Input.is_action_pressed("ui_left"): #move ledft
		move.x -= 1
	if Input.is_action_pressed("ui_up"): #move up
		move.y -= 1
	if Input.is_action_pressed("ui_down"): #move down
		move.y += 1
		
	if move.length() > 0: #verify is moving
		move = move.normalized() * velocity #normalized velocity
		
	position += move * delta #move player
	position.x = clamp(position.x, 0, bound.x)
	position.y = clamp(position.y, 0, bound.y)
	
	process_animation()

func _input(event):
	if event is InputEventScreenDrag:
		move += event.relative
		
		position += move
		process_animation()

func _on_laser_timer_timeout():
	create_laser()

func _on_Player_destroyed():
	create_explosion()
	queue_free()

func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		armor -= 1

func start(pos):
	show()
	position = pos
	$collision.call_deferred("set", "disabled", false)

func create_laser():
	var l = laser.instance()
	l.position = $cannon/laser_position.position
	add_child(l)

func create_explosion():
	var e = explosion.instance()
	e.position = position
	utils.main_node.add_child(e)

func set_armor(new_value):
	if new_value < armor:
		utils.main_node.add_child(flash.instance())
		
	armor = new_value
	emit_signal("armor_changed", armor)
	
	if armor <= 0:
		create_explosion()
		queue_free()

func process_animation():
	if move.x != 0:
		if move.x < 0:
			$sprite/animation.current_animation = "left"
		else:
			$sprite/animation.current_animation = "right"
	else:
		$sprite/animation.current_animation = "default"
