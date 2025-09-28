extends Node2D

func remove_bad_labels():
	%"Way help".visible = false
	%"Sacrifice help".visible = false
	$"Powerup help".text = "You must sacrifice your right arrow key\nto use the powerup"

func hit():
	%hitanim.play("hit")
	$player.apply_shake()
	Data.disabled = true

func small_hit():
	$%hitanim.play("small_hit")
	$player.apply_small_shake()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
