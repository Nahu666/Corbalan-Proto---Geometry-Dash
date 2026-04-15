extends CharacterBody2D


var SPEED = 50000
var JUMP_VELOCITY = -1450

var isOrbe = false
var fuerzaOrb = 0
var canInvert = false
var isUfo = false

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
			$arrastre.emitting = true


	# SALTO
	if Input.is_action_pressed("salto"):
		if isUfo == true or  is_on_floor():
			velocity.y = JUMP_VELOCITY
			$arrastre.emitting = false



	velocity.x = SPEED * delta

	if isOrbe and (Input.is_action_just_pressed("salto") or Input.is_action_just_pressed("salto")):
		velocity.y = -fuerzaOrb
		if canInvert == true:
			gravity = -gravity
			JUMP_VELOCITY = -JUMP_VELOCITY
			rotation = -rotation
			isOrbe = false

	move_and_slide()
	

func death():
	SPEED = 0
	$Sprite2D.visible = false
	$"explosión".emitting = true
	$arrastre.visible = false
	$AudioStreamPlayer2D.play()
	$Timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_externo_area_entered(area):
	if area.is_in_group("orbe"):
		isOrbe = true
		fuerzaOrb = area.fuerza
		canInvert = area.invertir
	
	if area.is_in_group("portal"):
		match area.tipo:
			0: #Cubo
				$Sprite2D.texture = load("res://assets/jugador.png")
				isUfo = false
			
			1: #UFO
				$Sprite2D.texture = load("res://assets/UFO07.png")
				isUfo = true

func _on_externo_area_exited(area):
	if area.is_in_group("orbe"):
		isOrbe = false
		fuerzaOrb = 0
		canInvert = false
