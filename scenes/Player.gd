extends CharacterBody2D

@export var walk_speed = 250
@export var dash_speed = 1000
@export var gravity = 980
@export var jump_speed = -500
@export var can_double_jump = false
@export var resistance = 0.9

@export var dash_duration = 0.4  # Duration of the dash in seconds
@export var dash_timer = 0.0

@export var dash_cooldown = 1.0  # Cooldown duration after dashing in seconds
@export var dash_cooldown_timer = 0.0

var is_dash_on_cooldown = false  # Flag to check if dash is on cooldown

@onready var animation = $AnimatedSprite2D

var is_dashing = false
var is_air_dashing = false

const PUSH_FORCE = 300  # Adjust this value for stronger push from Alien

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y += delta * gravity

	# Handle jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		can_double_jump = true

	if not is_on_floor() and Input.is_action_just_pressed("ui_up") and can_double_jump:
		velocity.y = jump_speed
		can_double_jump = false

	var direction := Input.get_axis("ui_left", "ui_right")

	# Horizontal movement
	if direction:
		velocity.x = direction * walk_speed
		animation.play("walk right 5")
		animation.flip_h = direction < 0
	else:
		velocity.x = 0
		animation.play("idle 5")

	# Dashing
	if Input.is_action_just_pressed("move_dash") and is_on_floor() and not is_dash_on_cooldown:
		is_dashing = true
		is_dash_on_cooldown = true  # Start cooldown after dashing
		dash_cooldown_timer = 0.0

	if is_dashing:
		dash_timer += delta

		if dash_timer <= dash_duration:
			velocity.x = direction * ease((dash_timer / dash_duration), 0.33) * dash_speed

		if dash_timer >= dash_duration:
			is_dashing = false
			dash_timer = 0

	# Air dashing
	if Input.is_action_just_pressed("move_dash") and not is_on_floor() and not is_dash_on_cooldown:
		is_air_dashing = true
		is_dash_on_cooldown = true  # Start cooldown after dashing
		dash_cooldown_timer = 0.0

	if is_air_dashing:
		dash_timer += delta

		if dash_timer <= dash_duration:
			if dash_timer <= 0.1:
				velocity.x = 0
				velocity.y = 0
			else:
				velocity.x = direction * dash_speed
				velocity.y = 0

		if dash_timer >= dash_duration:
			is_air_dashing = false
			dash_timer = 0

	# Dash cooldown management
	if is_dash_on_cooldown:
		dash_cooldown_timer += delta

		if dash_cooldown_timer >= dash_cooldown:
			is_dash_on_cooldown = false
			dash_cooldown_timer = 0

	move_and_slide()
