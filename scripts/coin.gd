extends Area2D



func _on_body_entered(body):
	Data.coins += 1
	if Data.coins >= 39:
		get_tree().quit(0)
	queue_free()
