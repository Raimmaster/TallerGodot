
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_process(true)
	
func _integrate_forces(state):
	var lev_vector = get_linear_velocity()
	print(lev_vector.x, " y:", lev_vector.y) 
	var animacion = ""
	var new_anim = ""
	var mover_righ = Input.is_action_pressed("move_right")
	
	if(mover_righ):
		new_anim = "run"
	else:
		new_anim = "standing"
	
	if(new_anim != animacion):
		animacion = new_anim
		get_node("AnimationPlayer").play(animacion)
	
	
func _process(delta):
	pass
	