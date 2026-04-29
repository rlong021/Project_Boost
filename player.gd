extends RigidBody3D



func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * 1000)
	
	if Input. is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0,100.00 * delta))
		
	if Input. is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-100.00 * delta))


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Goal"):
		print("You win!")
		
	if body.is_in_group("Hazard"):
		print("You crashed!")
	print(body.name)
