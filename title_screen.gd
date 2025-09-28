extends Control

func _ready() -> void:
	pass

func _on_button_button_down() -> void:
	$ColorRect/AnimationPlayer.play("start")
	$ColorRect.visible = true
	$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene2.tscn")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$ColorRect.visible = false
