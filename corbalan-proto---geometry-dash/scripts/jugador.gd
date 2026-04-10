extends CharacterBody2D


var SPEED = 50000
const JUMP_VELOCITY = -1450

var gravity = 5500

func _physics_process(delta):
	# GRAVEDAD
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite2D.rotation_degrees += 380 * delta
	else:
		var modulo = int($Sprite2D.rotation_degrees) % 90;
		if modulo > 45:
			$Sprite2D.rotation_degrees += (90 - modulo)
		else:
			$Sprite2D.rotation_degrees -= modulo

	# SALTO
	if Input.is_action_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	velocity.x = SPEED * delta


	move_and_slide()
	

func death():
	SPEED = 0
	$Sprite2D.visible = false
	$AudioStreamPlayer2D.play()
	$Timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
