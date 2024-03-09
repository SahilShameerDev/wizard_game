extends Area2D


@export var Left = false
@export var Right = false
@export var Up = false
@export var Down = false



func _on_body_entered(body):
	GameData.left=Left
	GameData.right=Right
	GameData.up=Up
	GameData.down=Down
