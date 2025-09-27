extends Label

	
func _process(delta: float) -> void:
	self.text = "x " + str(Data.lives)
