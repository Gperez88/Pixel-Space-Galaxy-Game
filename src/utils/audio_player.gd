extends Node

const samplers  = {
	explosion   = preload("res://assets/sounds/explosion.wav"),
	hit_enemy   = preload("res://assets/sounds/hit_enemy.wav"),
	hit_ship    = preload("res://assets/sounds/hit_ship.wav"),
	laser_enemy = preload("res://assets/sounds/laser_enemy.wav"),
	laser_ship  = preload("res://assets/sounds/laser_ship.wav"),
	power_up    = preload("res://assets/sounds/powerup.wav")
}

func player(sampler):
	$sampler_player.stream = sampler
	$sampler_player.play()
