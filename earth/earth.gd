extends Node3D

@export var rotation_speed_earth := 0.1
@export var rotation_speed_clouds := 0.08

@onready var earth: CSGSphere3D = $Earth
@onready var clouds: CSGSphere3D = $Clouds


func _process(delta: float) -> void:
	earth.rotation.y += rotation_speed_earth * delta
	clouds.rotation.y += rotation_speed_clouds * delta
