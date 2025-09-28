extends Area2D



func _on_body_entered(body):
	$AnimatedSprite2D.hide()
	$GPUParticles2D.emitting = true
	$CollisionShape2D.queue_free()
	$AudioStreamPlayer.play()
	Data.coins += 1
	if Data.coins >= 40:
		Data.reset()
		get_tree().change_scene_to_file("res://win screen.tscn")


func _on_timer_timeout() -> void:
	queue_free()
