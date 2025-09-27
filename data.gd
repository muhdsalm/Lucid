extends Node

@export var lives: int = 10
@export var health: int

func remove_life(amount: int = 1):
	lives -= amount
	if lives < 0:
		get_tree().reload_current_scene()
