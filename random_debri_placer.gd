extends Node2D

@export var spawn_margin := 48
@export var exclusion_radius := 220

@onready var viewport_size := get_viewport_rect().size

var debris := [
	preload("res://debris/old_booster.tscn"),
	preload("res://debris/old_satellite_dish.tscn")
]


func _ready() -> void:
	get_node("Timer").timeout.connect(_on_timer_timeout)


func _on_timer_timeout() -> void:
	spawn_item()


func spawn_item() -> void:
	var random_debri: PackedScene = debris.pick_random()
	var debri_instance := random_debri.instantiate()
	
	var random_position := get_random_position()
	var random_rotation := randf_range(0.0, 360.0)
	
	debri_instance.global_position = random_position
	debri_instance.global_rotation = random_rotation
	add_child(debri_instance)


func get_random_position() -> Vector2:
	var random_x := randf_range(0.0 + spawn_margin, viewport_size.x - spawn_margin)
	var random_y := randf_range(0.0 + spawn_margin, viewport_size.y - spawn_margin)
	var random_position = Vector2(random_x, random_y)
	
	var center = viewport_size / 2
	
	while is_in_exclusion_area(random_position, center, exclusion_radius):
		random_x = randf_range(0.0 + spawn_margin, viewport_size.x - spawn_margin)
		random_y = randf_range(0.0 + spawn_margin, viewport_size.y - spawn_margin)
		random_position = Vector2(random_x, random_y)

	return random_position

func is_in_exclusion_area(point, center, radius) -> bool:
	var distance_to_center = point.distance_to(center)
	return distance_to_center < radius
