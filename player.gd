extends CharacterBody2D

@export var speed = 100

@export var Left = false
@export var Right = false
@export var Up = false
@export var Down = false

@export var No_of_right = 0
@export var No_of_left = 0
@export var No_of_up = 0
@export var No_of_down = 0

@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite
@onready var uparrow = $Up
@onready var downarrow = $Down
@onready var leftarrow = $Left
@onready var rightarrow = $Right
@onready var RightText = $CanvasLayer/VBoxContainer/Right
@onready var LeftText = $CanvasLayer/VBoxContainer/Left
@onready var DownText = $CanvasLayer/VBoxContainer/Down
@onready var UpText = $CanvasLayer/VBoxContainer/Up
@onready var timer = $Timer
var moment = true


func sleep(s):
	await get_tree().create_timer(s).timeout


func up():
	velocity = speed * Vector2.UP
	anim.play("run")
	moment = false
	No_of_up -= 1
	UpText.text = str(No_of_up)
	disableVisiblity()
	
func down():
	velocity = speed * Vector2.DOWN
	anim.play("run")
	moment = false
	No_of_down -= 1
	DownText.text = str(No_of_down)
	disableVisiblity()

func left():
	velocity = speed * Vector2.LEFT
	anim.play("run")
	sprite.flip_h = true
	moment = false
	No_of_left -= 1
	LeftText.text = str(No_of_left)
	disableVisiblity()

func right():
	if No_of_right != 0 :
		velocity = speed * Vector2.RIGHT
		anim.play("run")
		sprite.flip_h = false
		moment = false
		No_of_right -= 1
		RightText.text = str(No_of_right)
		disableVisiblity()
	

func check_visiblity():
	if GameData.left == false or No_of_left == 0:
		leftarrow.visible=false
	else:
		leftarrow.visible=true
		
	if GameData.right == false or No_of_right == 0:
		rightarrow.visible=false
	else:
		rightarrow.visible=true
		
	if GameData.down == false or No_of_down == 0:
		downarrow.visible=false
	else:
		downarrow.visible=true
		
	if GameData.up == false or No_of_up == 0:
		uparrow.visible=false
	else:
		uparrow.visible=true
	
func get_input():
	if moment:
		if Input.is_action_pressed("up"):
			up()

		elif Input.is_action_pressed("down"):
			down()

		elif Input.is_action_pressed("left"):
			left()

		elif Input.is_action_pressed("right"):
			right()

	#	else:
	#		anim.play("idle")
		
		
		
func disableVisiblity():
	GameData.left=false
	GameData.right=false
	GameData.up=false
	GameData.down=false


func _ready():
	GameData.left=Left
	GameData.right=Right
	GameData.up=Up
	GameData.down=Down
	RightText.text = str(No_of_right)
	LeftText.text = str(No_of_left)
	UpText.text = str(No_of_up)
	DownText.text = str(No_of_down)
	
func _physics_process(delta):
	check_visiblity()
	get_input()
	move_and_slide()


func _on_area_entered(area):
	moment = true
	while(speed != 0):
		speed -= 20
		sleep(10)
	velocity = Vector2.ZERO
	speed = 100
	anim.play("idle")

func _on_down_button_down():
	if moment:
		down()


func _on_up_button_down():
	if moment:
		up()


func _on_left_button_down():
	if moment:
		left()


func _on_right_button_down():
	if moment:
		right()
