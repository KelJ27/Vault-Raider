extends RigidBody2D

enum {
	PAUSE,
	SPARKLE,
	SHINE
}

var picked = false
var state = SPARKLE
var newState = SHINE
var prevState
var animPlayer
var animation = "Pause"
var speedMultiplier = 8
onready var timer = get_node("Timer")

func _ready():
	animPlayer = get_node("AnimationPlayer")
	timer.set_wait_time(3)
	timer.start()

func _process(delta):
	if picked == true:
		self.position = get_node("../Player/Position2D").global_position
	playAnim()
	_input(picked)

func playAnim():
	match state:
			SHINE:
				animation = "Shine"
				animPlayer.play(animation, -speedMultiplier)
			SPARKLE:
				animation = "Sparkle"
				animPlayer.play(animation, -speedMultiplier)

func TimerTimeout():
	prevState = state
	if prevState == state:
		state = newState
		newState = prevState

func _input(event):
	if Input.is_action_just_pressed("e"):
		var bodies = $Detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Player" and picked == false:
				picked = true
