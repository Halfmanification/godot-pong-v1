extends CharacterBody2D

@export var paddle_speed: int
@export var bump_speed = 400
@export var bump_distance = 40
@export var bump_return_speed = 50

var default_position
var bump_triggered = false

func _ready():
	default_position = position
	
func _physics_process(delta):
	if bump_triggered:
		var forward_movement = Vector2(bump_speed, 0).rotated(rotation) * delta
		translate(forward_movement)
		
		if abs(default_position.x - position.x) >= bump_distance:
			bump_triggered = false
		
	elif position.x != default_position.x:
		var backward_movement = Vector2(-bump_return_speed, 0).rotated(rotation) * delta
		translate(backward_movement)
		
		if abs(position.x - default_position.x) < bump_return_speed * delta:
			position.x = default_position.x

func move_up(delta):
	move_and_collide(Vector2(0, -paddle_speed * delta))

func move_down(delta):
	move_and_collide(Vector2(0, paddle_speed * delta))

func bump(delta):
	if position.x == default_position.x:
		bump_triggered = true
