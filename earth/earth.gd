extends Node3D

@export var rotation_speed := 0.1

@onready var csg_sphere_3d: CSGSphere3D = $CSGSphere3D


func _process(delta: float) -> void:
	csg_sphere_3d.rotation.y += rotation_speed * delta
