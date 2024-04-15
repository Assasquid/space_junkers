extends Node2D

@onready var player: Area2D = $Player
@onready var player_ghosts: Node2D = $PlayerGhosts

var ghosts := []

func _ready() -> void:
	for child in player_ghosts.get_children():
		ghosts.append(child)

func _process(delta: float) -> void:
	player_ghosts.position = player.position
	
	for ghost in ghosts:
		ghost.rotation = player.rotation
