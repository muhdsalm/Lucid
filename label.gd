extends Label

	
func _process(delta: float) -> void:
	if Data.lives == 2:
		get_parent().get_node("AnimatedSprite2D3").visible = false
	if Data.lives == 1:
		get_parent().get_node("AnimatedSprite2D2").visible = false
