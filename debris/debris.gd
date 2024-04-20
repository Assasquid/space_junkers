extends Area2D

@export var max_rotation_speed := 1.0
@export var min_rotation_speed := 0.42
@export var flight_time := 0.24
@export var flight_time_offset := 0.19

@onready var player := get_tree().get_first_node_in_group("player")

var rotation_speed: float
var has_been_touched := false
var velocity := Vector2(0.0, 0.0)
var speed := 1000.0


func _ready() -> void:
	monitoring = true
	area_entered.connect(_on_area_entered)
	rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)


func _process(delta: float) -> void:
	if !has_been_touched:
		global_rotation += rotation_speed * delta
	
	if has_been_touched:
		var tween := create_tween()
		tween.set_parallel()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "position", player.global_position, flight_time)
		tween.tween_property(self, "scale", Vector2(0.0, 0.0), flight_time + flight_time_offset)
		tween.finished.connect(queue_free)
		


func _on_area_entered(area: Area2D) -> void:
		has_been_touched = true
		monitoring = false
