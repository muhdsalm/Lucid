extends CharacterBody2D


const SPEED = 80.0
const JUMP_VELOCITY = -260.0
var powerup_scene = preload("res://powerup.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * Data.jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("run_right") and Data.right:
		if velocity.x < SPEED:
			velocity.x += 10
		if not $AnimatedSprite2D.animation == "run":
			$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("run_left"):
		if not $AnimatedSprite2D.animation == "run":
				$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = true
		if velocity.x > -SPEED:
			velocity.x -= 10
	else:
		if not $AnimatedSprite2D.animation == "idle":
				$AnimatedSprite2D.animation = "idle"
		if velocity.x < 0:
			velocity.x += 5
		elif velocity.x > 0:
			velocity.x -= 5
	
	if Input.is_action_just_pressed("drop"):
		if not Data.right:
			var powerup = powerup_scene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
			powerup.scale = Vector2(0.5, 0.5)
			powerup.position = self.position
			
			get_parent().add_child(powerup)
			Data.jump = 1
			Data.right = true

	move_and_slide()
