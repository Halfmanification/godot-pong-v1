extends RigidBody2D

@export var max_speed = 1500

func _physics_process(delta):
	if abs(linear_velocity.x) < 50:
		linear_damp = 0
	else:
		linear_damp = 0.1
	
	linear_velocity = linear_velocity.clamp(Vector2(-max_speed, -max_speed), Vector2(max_speed, max_speed))
	print(linear_velocity)

func _on_body_entered(body):
	$HitSound.play()
