class_name Player

extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300
export var gravity = Vector2(0, 50)
var velocity:Vector2
var jump_strength = 600
var dash_speed = 900
var up_direction = Vector2(0,-1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Spear/AxisOfRotation.rotation = Vector2(1,0).angle_to_point(position-get_global_mouse_position())
	if Input.is_action_just_pressed("key_throw"):
		$Spear.stab()
