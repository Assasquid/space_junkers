extends Sprite2D

@export var initial_scale := 0.71
@export var target_scale := 0.42

@export var animation_duration: float
@export var min_duration := 0.91
@export var max_duration := 1.24


func _ready() -> void:
	animation_duration = randf_range(min_duration, max_duration)
	
	var tween := create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2(target_scale, target_scale), animation_duration)
	tween.tween_property(self, "scale", Vector2(initial_scale, initial_scale), animation_duration)
