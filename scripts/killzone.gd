extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	get_parent().hit()
	print("You Died!")
	$Timer.start(0)
	Data.reset()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
