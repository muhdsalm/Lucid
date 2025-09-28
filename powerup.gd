extends Node2D

var fire = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if fire:
		$AudioStreamPlayer.play()
		print($AudioStreamPlayer.playing)
		Data.right = false
		Data.jump = 1.4
		$Timer2.start()
		$Area2D.queue_free()
		$Sprite2D.queue_free()
		get_parent().remove_bad_labels()


func _on_timer_timeout() -> void:
	fire = true


func _on_audio_stream_player_finished() -> void:
	queue_free()
