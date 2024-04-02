extends Sprite2D

@export var initial_scale := 1.0
@export var target_scale := 0.6
@export var animation_duration: float


func _ready() -> void:
	animation_duration = randf_range(0.91, 1.24)
	
	var tween := create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2(target_scale, target_scale), animation_duration)
	tween.tween_property(self, "scale", Vector2(initial_scale, initial_scale), animation_duration)
