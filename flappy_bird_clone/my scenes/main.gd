extends Node2D

@export var pipe_scene = preload("res://my scenes/area_2d.tscn")

var score = 0

	
func _on_pipe_spawn_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.init()
	pipe.hit.connect($CharacterBody2D._on_hit)
	$Node2D.add_child(pipe)

	score += 1
	$Label.text = "SCORE: %s" % score
	
	
func _ready() -> void:
	$PipeSpawnTimer.start()
	score = 0


func _on_character_body_2d_death() -> void:
	$PipeSpawnTimer.stop()
