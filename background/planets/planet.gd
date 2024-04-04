extends Sprite2D

@export var initial_opacity := 0.69
@export var target_opacity := 0.19

@export var animation_duration: float
@export var min_duration := 1.19
@export var max_duration := 2.24

func _ready() -> void:
	modulate.a = initial_opacity
	
	animation_duration = randf_range(min_duration, max_duration)
	
	var tween := create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "modulate:a", target_opacity, animation_duration)
	tween.tween_property(self, "modulate:a", initial_opacity, animation_duration)
	
