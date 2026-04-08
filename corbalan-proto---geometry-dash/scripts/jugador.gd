extends CharacterBody2D


const SPEED = 35500
const JUMP_VELOCITY = -1000

var gravity = 4100

func _physics_process(delta):
	# GRAVEDAD
	if not is_on_floor():
		velocity += get_gravity() * delta

	# SALTO
	if Input.is_action_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	velocity.x = SPEED * delta


	move_and_slide()
