
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass
	

func _integrate_forces(state):
	var lv = state.get_linear_velocity()
	var move_r = Input.is_action_pressed("move_right")
	var anim = ""
	var new_anim = ""
	
	
	if(move_r):
		new_anim = "run"
		self.set_pos(Vector2(self.get_pos().x + 1, self.get_pos().y))
	else:
		new_anim = "standing"
	
	if(new_anim != anim):
		anim = new_anim
		get_node("AnimationPlayer").play(anim)
		
	
	print(self.get_pos())

