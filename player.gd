extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300
export var gravity = Vector2(0, 0.005)
var velocity:Vector2
var jump_strength = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	var mydirection:Vector2 = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		mydirection += Vector2(-1,0)
	if Input.is_action_pressed("ui_right"):
		mydirection += Vector2(1,0)
	
	if !is_on_floor():
		velocity += gravity
	else: 
		if Input.is_action_pressed("ui_up") and velocity.y > 0:
			velocity.y = -jump_strength
		else:
			velocity.y = gravity.y 
	
	mydirection += velocity
	
	move_and_slide(mydirection*speed, Vector2(0,-1))
