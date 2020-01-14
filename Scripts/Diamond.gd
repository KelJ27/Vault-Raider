extends KinematicBody2D

enum {
	PAUSE,
	SPARKLE,
	SHINE
}
var state = SHINE
var animPlayer
var animation = "Pause"
var speedMultiplier = 8


func _ready():
	animPlayer = get_node("AnimationPlayer")


func _process(delta):
	match state:
		PAUSE:
			animation = "Pause"
			animPlayer.play(animation, -speedMultiplier)
		SHINE:
			animation = "Shine"
			animPlayer.play(animation, -speedMultiplier)
		SPARKLE:
			animation = "Sparkle"
			animPlayer.play(animation, -speedMultiplier)
			
