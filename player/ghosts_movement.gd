extends Node2D

@onready var player: Area2D = $"../Player"

var ghosts := []

func _ready() -> void:
	for child in get_children():
		ghosts.append(child)

func _process(_delta: float) -> void:
	global_position = player.global_position
	
	for ghost in ghosts:
		ghost.global_rotation = player.global_rotation
