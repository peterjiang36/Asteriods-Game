extends CharacterBody2D

func _physics_process(delta):
	var input_vector := Vector2(0, input.get_axix("move_forward", "move_backward"))
	velocity = Vector2(0,0)
	move_and_slide()
