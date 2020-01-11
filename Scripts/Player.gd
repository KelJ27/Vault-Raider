extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var animPlayer
var speedMultiplier = 8

func _ready():
	set_physics_process(true)
	animPlayer = get_node("AnimationPlayer")

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('Right'):
        velocity.x += 1
				animPlayer.play("Walk Right", -speedMultiplier)
    if Input.is_action_pressed('Left'):
        velocity.x -= 1
				animPlayer.play("Walk Left", -speedMultiplier)
    if Input.is_action_pressed('Down'):
        velocity.y += 1
				animPlayer.play("Walk Down", -speedMultiplier)
    if Input.is_action_pressed('Up'):
        velocity.y -= 1
				animPlayer.play("Walk Up", -speedMultiplier)
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)