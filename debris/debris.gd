extends Area2D

@export var max_rotation_speed := 1.0
@export var min_rotation_speed := 0.42

var rotation_speed: float


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)


func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_area_entered(area: Area2D) -> void:
	queue_free()
