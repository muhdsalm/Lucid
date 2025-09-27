extends Node2D

var fire = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if fire:
		Data.right = false
		Data.jump = 1.4
		queue_free()
		get_parent().remove_bad_labels()


func _on_timer_timeout() -> void:
	fire = true
