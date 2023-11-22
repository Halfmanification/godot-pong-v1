extends CanvasLayer

var left_player_score = 0
var right_player_score = 0

func new_game():
	left_player_score = 0
	right_player_score = 0
	_set_score("left", left_player_score)
	_set_score("right", right_player_score)

func _on_goal_area_left_goal():
	right_player_score += 1
	_set_score("right", right_player_score)

func _on_goal_area_right_goal():
	left_player_score += 1
	_set_score("left", left_player_score)

func _set_score(score_recipient, score):
	match score_recipient:
		"right": $ScoreBoard/RightPaddleScore.text = _format_score(score)
		"left": $ScoreBoard/LeftPaddleScore.text = _format_score(score)
		_: pass

func _format_score(score):
	return str(score).pad_zeros(3)
