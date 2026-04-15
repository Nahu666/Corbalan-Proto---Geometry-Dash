extends Area2D


@export var tipo = 0
@onready var sprite = $Sprite2D
@onready var particulas = $CPUParticles2D
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
			particulas.color = Color.HOT_PINK
		
		1: #amarilla
			fuerza = 1500
			sprite.texture = load("res://assets/YellowRing.png")
			particulas.color = Color.YELLOW
		
		2: #azul
			fuerza = 800
			invertir = true
			sprite.texture = load("res://assets/CyanRing.png")
			particulas.color = Color.AQUA
		
		3: #roja
			fuerza = 2300
			sprite.texture = load("res://assets/RedRing.png")
			particulas.color = Color.RED
		
		4: #verde
			fuerza = -1500
			invertir = true
			sprite.texture = load("res://assets/GreenRing.png")
			particulas.color = Color.GREEN
		
		5: #negro
			fuerza = -2000
			sprite.texture = load("res://assets/BlackRing.png")
			particulas.color = Color.BLACK
	
		_ :
			fuerza = 0
