
class_name State

extends Node

var state_machine = null 

# abstract class, just declares certain functions that children will have to implement

func enter(_msg := {}) -> void:
	pass

func exit() -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
	
func update(_delta:float) -> void:
	pass

func physics_update(_delta:float) -> void:
	pass


