extends Label

func _process(delta: float) -> void:
	text = str(Data.coins) + " / 40"
