extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
const GRAVITY = 500
const MOVE_SPEED = 150
const JUMP_SPEED = 100

var velocidad = Vector2()
var new_anim = ""
var animacion = ""

func _fixed_process(delta):
	var move_right = Input.is_action_pressed("move_right")
	var move_left = Input.is_action_pressed("move_left")
	var jump = Input.is_action_pressed("saltar")
	
	velocidad.y += delta * GRAVITY
	
	if(move_left):
		new_anim = "run_left"
		velocidad.x = - MOVE_SPEED
	elif (move_right):
		new_anim = "standing"
		velocidad.x = MOVE_SPEED
	else:
		new_anim = "running"
		velocidad.x = 0
	
	if(jump):
		#print("jump")
		velocidad.y = -JUMP_SPEED 
	var motion = velocidad * delta
	motion = move(motion)
	
	if(new_anim != animacion):
		animacion = new_anim
		get_node("AnimationPlayer").play(animacion)


	if(is_colliding()):
		var norm = get_collision_normal()
		velocidad.y = 0
		print("motion before: ", motion)
		motion = norm.slide(motion)
		print("motion now: ", motion)
		velocidad = norm.slide(velocidad)
		move(motion)
	
	#print("delta: ", delta)

func _ready():
	# Initialization here
	set_fixed_process(true)
	pass