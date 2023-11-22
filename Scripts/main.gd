extends Node2D

func _ready():
	$HUD.new_game()
	$Music.play()

func _physics_process(delta):
	
	# (PLAYER) right paddle movement
	if Input.is_action_pressed("move_up"):
		$RightPaddle.move_up(delta)
	if Input.is_action_pressed("move_down"):
		$RightPaddle.move_down(delta)
	if Input.is_action_pressed("bump_paddle"):
		$RightPaddle.bump(delta)
	
	# (BOT) left paddle movement
	if $LeftPaddle.position.y < $Ball.position.y:
		$LeftPaddle.move_down(delta)
	if $LeftPaddle.position.y > $Ball.position.y:
		$LeftPaddle.move_up(delta)
