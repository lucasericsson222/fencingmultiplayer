extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var air_resistance:float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var old_position = global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for child in get_children():
		if child.has_method("apply_central_impulse"):
			child.apply_central_impulse( 1000 * (old_position-global_position).normalized())
	old_position = global_position
