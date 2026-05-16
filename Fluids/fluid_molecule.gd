extends CharacterBody2D

@export var GRAVITY : float = 9.8

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0
	
	move_and_slide()
