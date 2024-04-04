extends Node2D

@export var min_planet_number := 12
@export var max_planet_number := 20

@export var min_star_number := 19
@export var max_star_number := 27

var background_planets := [
	preload("res://background/planets/blue_planet_s.tscn"),
	preload("res://background/planets/blue_planet_xs.tscn"),
	preload("res://background/planets/blue_planet_xxs.tscn"),
	preload("res://background/planets/red_planet_s.tscn"),
	preload("res://background/planets/red_planet_xs.tscn"),
	preload("res://background/planets/red_planet_xxs.tscn"),
	preload("res://background/planets/teal_planet_s.tscn"),
	preload("res://background/planets/teal_planet_xs.tscn"),
	preload("res://background/planets/teal_planet_xxs.tscn")
]

var background_stars := [
	preload("res://background/stars/white_star_s.tscn"),
	preload("res://background/stars/white_star_m.tscn"),
	preload("res://background/stars/white_star_l.tscn"),
	preload("res://background/stars/white_star_xl.tscn"),
	preload("res://background/stars/yellow_star_s.tscn"),
	preload("res://background/stars/yellow_star_m.tscn"),
	preload("res://background/stars/yellow_star_l.tscn"),
	preload("res://background/stars/yellow_star_xl.tscn")
]


func _ready() -> void:
	var viewport_size := get_viewport_rect().size
	
	for planet in background_planets:
		for number in range(randi_range(min_planet_number, max_planet_number)):
			var planet_instance = planet.instantiate()
			add_child(planet_instance)
			
			var random_position := Vector2(0.0, 0.0)
			random_position.x = randf_range(0.0, viewport_size.x)
			random_position.y = randf_range(0.0, viewport_size.y)
			
			planet_instance.position = random_position
	
	for star in background_stars:
		for number in range(randi_range(min_star_number, max_star_number)):
			var star_instance = star.instantiate()
			add_child(star_instance)
			
			var random_position := Vector2(0.0, 0.0)
			random_position.x = randf_range(0.0, viewport_size.x)
			random_position.y = randf_range(0.0, viewport_size.y)
			
			star_instance.position = random_position
