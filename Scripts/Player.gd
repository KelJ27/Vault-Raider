extends KinematicBody2D

export (int) var speed = 200

# Declared variables
var velocity = Vector2()
var animPlayer
var speedMultiplier = 8
var movement = "Idle"
var can_pick = true

# Called once when game runs
func _ready():
	set_physics_process(true)
	animPlayer = get_node("AnimationPlayer")

# Player's input function for movement
func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("Right"):
		movement = "Walk Right"
		velocity.x += 1
		animPlayer.play("Walk Right", -speedMultiplier)
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
	velocity = velocity.normalized() * speed

# Processes are carrited out every frame
func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)
