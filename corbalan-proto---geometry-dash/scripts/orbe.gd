extends Area2D


@export var tipo = 0
@onready var sprite = $Sprite2D
var fuerza
var invertir = false

func _ready():
	
	"""
	0 = rosa
	1 = amarillo
	2 = azul
	3 = rojo
	4 = verde
	5 = negro
	"""
	
	match tipo:
		0: #rosa
			fuerza = 1200
			sprite.texture = load("res://assets/MagentaRing.png")
		
		1: #amarilla
			fuerza = 1500
			sprite.texture = load("res://assets/YellowRing.png")
		
		2: #azul
			fuerza = 800
			invertir = true
			sprite.texture = load("res://assets/CyanRing.png")
		
		3: #roja
			fuerza = 2300
			sprite.texture = load("res://assets/RedRing.png")
		
		4: #verde
			fuerza = -1500
			invertir = true
			sprite.texture = load("res://assets/GreenRing.png")
		
		5: #negro
			fuerza = -2000
			sprite.texture = load("res://assets/BlackRing.png")
	
		_ :
			fuerza = 0
