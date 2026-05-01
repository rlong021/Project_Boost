extends RigidBody3D

## How much vercial force to apply when moving
@export_range(750.0,3000.0) var thrust: float = 1000.0

@export var torque_thrust: float = 100.0


func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
	
	if Input. is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0,torque_thrust * delta))
		
	if Input. is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-torque_thrust * delta))


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Goal"):
		complete_level()
		print("You win!")
		
	if body.is_in_group("Hazard"):
		crash_sequence()
	print(body.name)

func crash_sequence() -> void:
	print("Kaboom!")
	get_tree().reload_current_scene()
	
func complete_level() -> void:
	print("You win!")
	get_tree().quit()
