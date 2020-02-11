extends KinematicBody2D

enum {
	IDLE,
	NEW_DIRECTIION,
	MOVE
}

const SPEED = 100
var state = IDLE
var direction = Vector2.RIGHT

func _ready():
	randomize()

func _process(delta):
	match state:
		IDLE:
			pass
			
		NEW_DIRECTIION:
			direction = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			state = choose([IDLE, MOVE])
			
		MOVE:
			 move(delta)
			
func move(delta):
	position += direction * SPEED * delta
	
func choose(array):
	array.shuffle()
	return array.front()


func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	state = choose([IDLE, NEW_DIRECTIION, MOVE])
