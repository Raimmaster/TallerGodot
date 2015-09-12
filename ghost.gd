
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var anim = ""
var player = preload("res://player_1.gd")
var walkSpeed = 100
const DEAD = 0
const LIVE = 1
var direction = -1
var estado = ALIVE
var r_left = null
var r_right = null

func _ready():
	# Initialization here
	r_left = get_node("ray_left")
	r_right = get_node("ray_right")
	pass

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	var newAnim = anim
	if(estado == ALIVE):
		newAnim = "move_right"
		for i in range(state.get_contact_count()):
			var collider_object = state.get_contact_collider_object(i)
			var vNormal = state.get_contact_local_normal(i)
			var wall_side = 0
			if(collider_object):
				if(collider_object extends player && !collider_object.disabled):
					set_mode(MODE_RIGID)
					estado = DEAD
					state.set_angular_velocity(sign(vNormal.x)*33)
					set_friction(1)
					collider_object.disable()
					break
					
			if(vNormal.x > 0.9):
				wall_side = 1
			elif(vNormal.x < -0.9):
				wall_side = -1
				
		#if(wall_side != 0 && wall_side != direction):
			#direction = -direction
			#new_anim
		if(direction < 0 and not r_left.is_colliding() and r_right.is_colliding()):
			direction = -direction
			newAnim = "move_left"
		elif(direction > 0 and not r_right.is_colliding() and r_left.is_colliding()):
			direction = -direction
			newAnim = "move_right"
				
		velocity.x = direction * walkSpeed
				
	if(anim != newAnim):
		anim = newAnim
		get_node("AnimationPlayer").play(anim)
		
	state.set_linear_velocity(state)


