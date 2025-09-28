extends CharacterBody2D

var direction = 1
@export var speed = 100

func _ready() -> void:
	velocity = Vector2(direction * speed, 0)

func _physics_process(delta: float) -> void:
	move_and_slide()

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	direction *= -1
	velocity.x = speed * direction
	$AnimatedSprite2D.flip_h = true


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	direction *= -1
	velocity.x = speed * direction
	$AnimatedSprite2D.flip_h = false


func _on_self_body_entered(body: Node2D) -> void:
	print("Hit")
	Data.remove_life(1)
	if Data.lives == 0:
		$death.play()
	else:
		$AudioStreamPlayer.play()
