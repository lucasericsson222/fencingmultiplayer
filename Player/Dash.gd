extends PlayerState

func enter(_msg := {}) -> void:
	var timer = Timer.new()
	timer.connect("timeout", self, "_on_end_dash_timer")
	player.add_child(timer)
	timer.one_shot= true
	timer.wait_time = 0.1
	timer.start()

func physics_update(_delta: float) -> void:
	var mydirection = Vector2(sign(player.velocity.x), 0)
	
	player.move_and_slide(mydirection * player.dash_speed, player.up_direction)

func _on_end_dash_timer():
	state_machine.transition_to("Walking")
