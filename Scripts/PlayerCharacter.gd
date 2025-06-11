class_name PlayerCharacter
extends CharacterBody2D

@export var speed := 200
@export var _animation_player: AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("right"):
		flip(false)
		_animation_player.play("player/walk")
	else:
		_animation_player.stop()
	
	if Input.is_action_pressed("left"):
		flip(true)
		_animation_player.play("player/walk")
	else:
		_animation_player.stop()

func flip(val: bool):
	$Body.flip_h = val
	$Body/Hair.flip_h = val
	$Body/Tool.flip_h = val
