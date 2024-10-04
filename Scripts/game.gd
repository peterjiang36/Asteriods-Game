extends Node2D

@onready var lasers = $Lasers
@onready var player = $Player
@onready var asteriods = $Asteroids

var asteroid_scene = preload("res://Scenes/asteriod.tscn")

func _ready() -> void:
	player.connect("laser_shot", _on_player_laser_shot)	
	
	for asteriod in asteriods.get_children():
		asteriod.connect("exploded", _on_asteroid_exploded)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	
func _on_player_laser_shot(laser):
	lasers.add_child(laser)

func _on_asteroid_exploded(pos, size):
	for i in range(2):
			match size:
				Asteroid.AsteroidSize.LARGE:
					spawn_asteroid(pos, Asteroid.AsteroidSize.MEDIUM)
				Asteroid.AsteroidSize.MEDIUM:
					spawn_asteroid(pos, Asteroid.AsteroidSize.SMALL)
				Asteroid.AsteroidSize.SMALL:
					pass
		
func spawn_asteroid(pos, size):
	var a = asteroid_scene.instantiate()
	a.global_position = pos
	a.size = size
	a.connect("exploded", _on_asteroid_exploded)
	asteriods.add_child(a)
	asteriods.call_deferred("add_child", a)
	
