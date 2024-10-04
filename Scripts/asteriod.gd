extends Area2D

var movement_vecotr := Vector2(0, -1)

enum AsteroidSize{LARGE, MEDIUM, SMALL}
@export var size := AsteroidSize.LARGE

var speed := 50

@onready var sprite = $Sprite2D
@onready var cshape = $CollisionShape2D

func _ready():
	rotation = randf_range(0, 2*PI)
	
	match size:
		AsteroidSize.LARGE:
			speed = randf_range(50, 100)
			sprite.texture = preload("res://ASSET/PNG/Meteors/meteorGrey_big4.png")
			cshape.shape = preload("res://Resources/asteriod_cshape_large.tres")
		AsteroidSize.MEDIUM:
			speed = randf_range(100, 150)
			sprite.texture = preload("res://ASSET/PNG/Meteors/meteorGrey_med2.png")
			cshape.shape = preload("res://Resources/asteriod_cshape_medium.tres")
		AsteroidSize.SMALL:
			speed = randf_range(100,200)
			sprite.texture = preload("res://ASSET/PNG/Meteors/meteorGrey_tiny1.png")
			cshape.shape = preload("res://Resources/asteriod_cshape_small.tres")
	

func	 _physics_process(delta: float) -> void:
	global_position += movement_vecotr.rotated(rotation) * speed * delta
