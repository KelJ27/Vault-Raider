extends KinematicBody2D

enum {
	PAUSE,
	SPARKLE,
	SHINE
}

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
	playAnim()

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

