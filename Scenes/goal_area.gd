extends Area2D

signal goal

func _on_body_entered(body):
	goal.emit()
