extends Area2D

signal destroyed
export (int) var velocity
export (PackedScene) var laser

enum PLAYER_STATUS {destroyed, alive}

var current_status = PLAYER_STATUS.alive
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


func _on_laser_timer_timeout():
	create_laser()


func _on_Player_destroyed():
	current_status = PLAYER_STATUS.destroyed
	$sprite/animation.current_animation = "explosion"
	$explosion_particle.emitting = true
	$collision.call_deferred("set", "disabled", true)


func _on_animation_animation_finished(anim_name):
	if anim_name == "explosion":
		queue_free()


func start(pos):
	show()
	position = pos
	$collision.call_deferred("set", "disabled", false)


func create_laser():
	var l = laser.instance()
	add_child(l)
	
	var laser_begin_position = Vector2($sprite.position.x-2, $sprite.position.y-6)
	l.position = laser_begin_position


func process_animation():
	if current_status == PLAYER_STATUS.destroyed:
		return
	
	if move.x != 0:
		if move.x < 0:
			$sprite/animation.current_animation = "left"
		else:
			$sprite/animation.current_animation = "right"
	else:
		$sprite/animation.current_animation = "default"
