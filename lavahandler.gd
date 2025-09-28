extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Data.remove_life(1)
	get_parent().small_hit()
	if Data.lives == 0:
		$AudioStreamPlayer2.play()
	else:
		$AudioStreamPlayer.play()
	print(Data.lives)
