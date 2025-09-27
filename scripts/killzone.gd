extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	print("You Died!")
	get_tree().reload_current_scene()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
