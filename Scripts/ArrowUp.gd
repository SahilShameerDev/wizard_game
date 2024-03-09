extends Area2D

signal  clicked



func _on_mouse_entered():
	if Input.is_action_just_pressed("leftclick"):
		emit_signal("clicked")

