extends Area2D


var movement_vecotr := Vector2(0, -1)

var speed := 50

func	 _physics_process(delta: float) -> void:
	global_position += movement_vecotr.rotated(rotation) * speed * delta
