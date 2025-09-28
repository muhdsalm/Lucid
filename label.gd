extends Label

var dead = false
	
func _process(delta: float) -> void:
	if Data.lives == 2:
		get_parent().get_node("Sprite2D").modulate.a8 = 52
		get_parent().get_node("AnimatedSprite2D").visible = false
	if Data.lives == 1:
		get_parent().get_node("Sprite2D").modulate.a8 = 104
		get_parent().get_node("AnimatedSprite2D2").visible = false
	if Data.lives == 0 and not dead:
		get_parent().get_node("AnimatedSprite2D3").visible = false
		Data.disabled = true
		dead = true
		get_parent().get_parent().hit()
		$Timer.start()
		
		


func _on_timer_timeout() -> void:
	Data.reset()
	get_tree().reload_current_scene()
