extends CharacterBody2D


@export var MAX_SPEED = 300.0


func _process(_delta):
	var movement_vector := get_movement_vector()
	var direction := movement_vector.normalized()
	
	if (direction != Vector2.ZERO):
		$InteractorComponent.rotation = direction.angle()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_movement_vector() -> Vector2:
	var x_movement := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement := Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)
