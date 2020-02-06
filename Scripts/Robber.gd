extends KinematicBody2D

var speed = 150

func _ready():
	set_physics_process(true)
	
	
func _fixed_process(delta):
	var Move = Vector2()
	var body = get_node("body").get_overlapping_bodies()
	if(body.size() != 0):
		for tinge in body:
			if(tinge.is_in_group("Player")):
				if(tinge.get_global_position().x < self.get_global_position().x):
					Move += Vector2(-1,0)
				if(tinge.get_global_position().x > self.get_global_position().x + 5):
					Move += Vector2(1,0)
				if(tinge.get_global_position().y < self.get_global_position().y +5):
					Move += Vector2(0,-1)
				if(tinge.get_global_position().y > self.get_global_position().y):
					Move += Vector2(0,1)
					
	Move = Move.normalized() * speed * delta
	Move = move_and_slide(Move)
