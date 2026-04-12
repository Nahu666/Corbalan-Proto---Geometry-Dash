extends Area2D

@export var tipo : int

@onready var imagen : Sprite2D = $Sprite2D

func _ready():
	match tipo:
		0: #Cubo
			imagen.modulate = Color()
		
		1: #UFO
			imagen.modulate = Color()
