
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
const GRAVITY = 500
const MOVE_SPEED = 200
const JUMP_SPEED = 300

var velocidad = Vector2()

func _fixed_process(delta):
	var move_right = Input.is_action_pressed("move_right")
	var move_left = Input.is_action_pressed("move_left")
	var jump = Input.is_action_pressed("saltar")
	
	velocidad.y += delta * GRAVITY
	
	if(move_left):
		velocidad.x = - MOVE_SPEED
	elif (move_right):
		velocidad.x = MOVE_SPEED
	
	if(jump):
		#print("jump")
		velocidad.y = -JUMP_SPEED 
	var motion = velocidad * delta
	motion = move(motion)
	
	if(is_colliding()):
		var norm = get_collision_normal()
		velocidad.y = 0
		motion = norm.slide(motion)
		velocidad = norm.slide(velocidad)
		move(motion)
	print("delta: ", delta)

func _ready():
	# Initialization here
	set_fixed_process(true)
	pass


