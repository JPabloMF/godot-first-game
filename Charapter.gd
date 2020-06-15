extends RigidBody2D
var screensize

func _ready():
	screensize = get_viewport().get_visible_rect().size

var velocity = Vector2()
const GRAVITY = 2000
const JUMP_FORCE =800
const MAX_SPEED = 50

func get_input():
	velocity = Vector2()
#	var coliBodies = get_colliding_bodies()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('up'):
		velocity.y -= JUMP_FORCE
#	if coliBodies.size() > 0 and Input.is_action_pressed('up'):
##		velocity.y = jump_speed
#		print(coliBodies)
#		if get_node("../Floor2") in coliBodies:
#			print(true)
#			velocity.y -= 2000
		
	velocity = velocity.normalized() * MAX_SPEED

func _physics_process(delta):
	get_input()
	self.apply_impulse(Vector2(0,0),velocity)
