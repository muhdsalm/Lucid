extends Area2D



func _on_body_entered(body):
	$AnimatedSprite2D.hide()
	$GPUParticles2D.emitting = true
	$CollisionShape2D.queue_free()
	Data.coins += 1
	if Data.coins >= 39:
		get_tree().quit(0)


func _on_timer_timeout() -> void:
	queue_free()
