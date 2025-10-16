extends Area2D

@export var speed = 600

signal hit
var hitted = false

func init():
	position.x = 900
	position.y =  randf_range(700, 1000)
	var hitted = false
	
func _physics_process(delta: float) -> void:
	
	
	if position.x < -100:
		queue_free()
	
	if hitted == true:
		position.x = position.x
		
	else :
		position.x -= speed * delta
	


	


func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	hitted = true;
