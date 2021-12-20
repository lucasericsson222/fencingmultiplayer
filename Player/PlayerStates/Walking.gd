extends PlayerState



func enter(_msg := {}) -> void:
	pass


func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("key_dash"):
		state_machine.transition_to("Dash")
	var mydirection:Vector2 = Vector2(0,0)
	if Input.is_action_pressed("key_left"):
		player.get_node("nose").flip_h = false
		mydirection += Vector2(-1,0)
	if Input.is_action_pressed("key_right"):
		player.get_node("nose").flip_h = true
		mydirection += Vector2(1,0)
	
	if !player.is_on_floor():
		player.velocity.y += player.gravity.y
	else: 
		if Input.is_action_pressed("key_up") and player.velocity.y > 0:
			player.velocity.y = -player.jump_strength
		else:
			player.velocity.y = player.gravity.y 
	
	mydirection.y += player.velocity.y
	
	mydirection.x = mydirection.x * player.speed # consistent jump height regardless of "speed" variable
	player.velocity.x = mydirection.x
	player.move_and_slide(mydirection, player.up_direction)
	
