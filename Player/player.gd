class_name Player

extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 30
export var gravity = Vector2(0, 9.8)
var velocity:Vector2
var jump_strength = 250
var dash_speed = 400
var up_direction = Vector2(0,-1)
var max_speed = 170
var decelerate_speed = 30
var nose_position = Vector2(0,0)
var hat_position = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
var new_hat_position = Vector2(0,0)
var throw_power = 400
func _ready():
	nose_position = $nose.position
	hat_position = $hat.position

	pass # Replace with function body.

func _process(delta):
	var offset = Vector2(0,0)
	if Input.is_action_pressed("key_up"):
		offset += Vector2(0,-1)
	if Input.is_action_pressed("key_down"):
		offset += Vector2(0,1)
	if Input.is_action_pressed("key_left"):
		offset += Vector2(-1,0)
	if Input.is_action_pressed("key_right"):
		offset += Vector2(1,0)
	var nose_offset =Vector2(offset.x * 3, offset.y * 2) 
	var new_nose_position =  Vector2((get_global_mouse_position() - global_position).normalized().x * 3  , (get_global_mouse_position() - global_position).normalized().y * 2)
	$nose.position = lerp($nose.position, nose_position + new_nose_position, 0.05)

	if velocity.y > 10: 
		new_hat_position =  Vector2(0,-4)
	else:
		new_hat_position = Vector2(0,0)
	if offset.y > 0:
		new_hat_position += Vector2(0,1)
	if is_on_floor():
		$hat.position = lerp($hat.position, hat_position + new_hat_position, 0.05)
	else:
		$hat.position = lerp($hat.position, hat_position + new_hat_position, 0.002)
	
	
