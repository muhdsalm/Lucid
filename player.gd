extends CharacterBody2D


const SPEED = 80.0
const JUMP_VELOCITY = -260.0
var powerup_scene = load("res://powerup.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * Data.jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("run_right") and Data.right and not Data.disabled:
		if not $AudioStreamPlayer.is_playing():
			$AudioStreamPlayer.play()
		$GPUParticles2D.emitting = true
		if velocity.x < SPEED:
			velocity.x += 10
		if not $AnimatedSprite2D.animation == "run":
			$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("run_left") and not Data.disabled:
		if not $AudioStreamPlayer.is_playing():
			$AudioStreamPlayer.play()
		$GPUParticles2D.emitting = true
		if not $AnimatedSprite2D.animation == "run":
				$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = true
		if velocity.x > -SPEED:
			velocity.x -= 10
	else:
		$AudioStreamPlayer.stop()
		$GPUParticles2D.emitting = false
		if not $AnimatedSprite2D.animation == "idle":
				$AnimatedSprite2D.animation = "idle"
		if velocity.x < 0:
			velocity.x += 5
		elif velocity.x > 0:
			velocity.x -= 5
	
	if Input.is_action_just_pressed("drop") and not Data.disabled:
		if not Data.right:
			$AudioStreamPlayer2.play()
			var powerup = powerup_scene.instantiate()
			powerup.scale = Vector2(0.5, 0.5)
			powerup.position = Vector2(self.position.x, self.position.y - 8)
			
			get_parent().add_child(powerup)
			Data.jump = 1
			Data.right = true

	move_and_slide()

# The starting range of possible offsets using random values
@export var RANDOM_SHAKE_STRENGTH: float = 30.0
@export var SMALL_RANDOM_SHAKE_STRENGTH: float = 2
# Multiplier for lerping the shake strength to zero
@export var SHAKE_DECAY_RATE: float = 5.0

@onready var camera = $Camera2D
@onready var rand = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func _ready() -> void:
	rand.randomize()

func apply_shake() -> void:
	shake_strength = RANDOM_SHAKE_STRENGTH

func apply_small_shake() -> void:
	shake_strength = SMALL_RANDOM_SHAKE_STRENGTH

func _process(delta: float) -> void:
	# Fade out the intensity over time
	shake_strength = lerp(shake_strength, 0.00, SHAKE_DECAY_RATE * delta)

	# Shake by adjusting camera.offset so we can move the camera around the level via it's position
	camera.offset = get_random_offset()

func get_random_offset() -> Vector2:
	return Vector2(
		rand.randf_range(-shake_strength, shake_strength),
		rand.randf_range(-shake_strength, shake_strength)
	)
