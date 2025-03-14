extends CharacterBody2D

const SPEED = 100.0

@onready var movement_timer = $MovementTimer
@onready var animation = $AnimatedSprite2D

@onready var walking_audio = $WalkingAudio
@onready var collision_audio = $CollisionAudio

var direction: int = [-1, 0, 1].pick_random()  # Pick a random initial direction
var duration = randi_range(1, 3)  # Pick an initial random duration

var collided = false


func _ready() -> void:
	movement_timer.wait_time = duration 
	movement_timer.start()  

func _physics_process(delta: float) -> void:
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")
	else:
		velocity.x = direction * SPEED
		animation.play("fly right")
		animation.flip_h = direction < 0
		
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name == "CharacterBody2D":
			collided = true
			
			walking_audio.stop()
			collision_audio.play()
			
			await collision_audio.finished
			walking_audio.play()
			
			collided = false
		
	
	move_and_slide()

func _on_movement_timer_timeout() -> void:
	direction = [-1, 0, 1].pick_random()  
	duration = randi_range(1, 3)  

	movement_timer.wait_time = duration  
	movement_timer.start() 
