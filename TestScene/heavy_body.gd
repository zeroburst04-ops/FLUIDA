extends RapierCharacterBody2D

func _process(delta: float) -> void:
	velocity.y += 1
	move_and_slide()
