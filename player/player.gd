extends Area2D

@export var max_speed := 1200.0
@export var velocity := Vector2(0, 0)
@export var steering_factor := 3.0


func _process(delta: float) -> void:
	var direction := Vector2(0.0, 0.0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
	
	if velocity.length() > 0.0:
		rotation = velocity.angle()
