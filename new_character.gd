
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var animacion = ""
var mover_righ = Input.is_action_pressed("move_right")

func _ready():
	# Initialization here
	set_process(true)
	
	
	
	
func _process(delta):
	if(mover_righ):
		animacion = "run"
	else:
		animacion = "stand"
	get_node("AnimationPlayer").play(animacion)