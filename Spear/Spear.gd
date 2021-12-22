extends KinematicBody2D

var velocity:Vector2
var gravity := Vector2(0,9.8)
var collided = false
var thrown = false
func _physics_process(delta):
	if thrown:
		if !collided:
			velocity += gravity
			if move_and_collide(velocity * delta) != null:
				collided = true
			rotation = velocity.angle() + PI/2
	else:
		rotation = (get_global_mouse_position()-global_position).angle()+ PI/2
