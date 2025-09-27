extends Node

@export var lives: int = 3
@export var health: int

@export var right = true
@export var jump = 1

@export var coins = 0

func reset():
	lives = 3
	right = true
	jump = 1
	coins = 0
	

func remove_life(amount: int = 1):
	lives -= amount
	if lives < 1:
		get_tree().reload_current_scene()
		reset()
