extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Data.remove_life(1)
	print(Data.lives)
