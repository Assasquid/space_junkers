extends Node2D

@export var max_speed := 1200.0
@export var steering_factor := 3.0

@onready var player: Area2D = $Player

var velocity := Vector2(0.0, 0.0)


func _process(delta: float) -> void:
	var direction := Vector2(0.0, 0.0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_vector * steering_factor * delta
	global_position += velocity * delta
	
	var viewport_size := get_viewport_rect().size
	global_position.x = wrapf(global_position.x, 0, viewport_size.x)
	global_position.y = wrapf(global_position.y, 0, viewport_size.y)
	
	if velocity.length() > 0.0:
		player.global_rotation = velocity.angle()

func get_velocity() -> Vector2:
	return velocity
