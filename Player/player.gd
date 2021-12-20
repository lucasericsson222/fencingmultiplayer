class_name Player

extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 150
export var gravity = Vector2(0, 25)
var velocity:Vector2
var jump_strength = 400
var dash_speed = 450
var up_direction = Vector2(0,-1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
