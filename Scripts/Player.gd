extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var animPlayer
var speedMultiplier = 8
<<<<<<< HEAD
var movement = "Idle"
=======
var movement
>>>>>>> 156dd5201285726646b87e5953d882632b8d5ad3

func _ready():
	set_physics_process(true)
	animPlayer = get_node("AnimationPlayer")

func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("Right"):
<<<<<<< HEAD
		velocity.x += 1
		animPlayer.play("Walk Right", -speedMultiplier)
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		animPlayer.play("Walk Left", -speedMultiplier)
	if Input.is_action_pressed("Down"):
		velocity.y += 1
		animPlayer.play("Walk Down", -speedMultiplier)
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
		animPlayer.play("Walk Up", -speedMultiplier)
=======
		movement = "Walk Right"
		velocity.x += 1
		animPlayer.play(movement, -speedMultiplier)
	elif Input.is_action_pressed("Left"):
		movement = "Walk Left"
		velocity.x -= 1
		animPlayer.play(movement, -speedMultiplier)
	elif Input.is_action_pressed("Down"):
		movement = "Walk Down"
		velocity.y += 1
		animPlayer.play(movement, -speedMultiplier)
	elif Input.is_action_pressed("Up"):
		movement = "Walk Up"
		velocity.y -= 1
		animPlayer.play(movement, -speedMultiplier)
	else:
		movement = "Idle"
		animPlayer.play(movement, -speedMultiplier)
>>>>>>> 156dd5201285726646b87e5953d882632b8d5ad3
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)