extends CharacterBody2D

@export var gravity = 1000
@export var flapping = -600
var dead = false

signal death
	
func die():
	dead = true
	death.emit()

func _on_hit():
	die()

func _ready() -> void:
	dead = false
	position.x = 153
	position.y = 468 
	$AnimatedSprite2D.play()
	

func _physics_process(delta: float) -> void:
	if dead == false:
		if Input.is_action_just_pressed("click"):
			velocity.y = flapping 
	
		velocity.y += gravity * delta
	
		rotation = velocity.y/30 * delta
	else:
		rotation = PI/2
		velocity.y += gravity * delta
	
	move_and_slide()
	

func _on_ground_body_entered(body: Node2D) -> void:
	die()
