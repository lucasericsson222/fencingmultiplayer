extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var air_resistance:float
var velocity = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var old_position = global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = get_parent().velocity
	for child in get_children():
		if child.has_method("apply_central_impulse"):
			if get_parent().is_on_floor():
				velocity = Vector2.ZERO
			child.apply_central_impulse( -1000 * (velocity).normalized())
			
	old_position = global_position
