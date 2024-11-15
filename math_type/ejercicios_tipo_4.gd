extends Area2D

@export var velocidad = 100  # Velocidad de caída
signal pierde_juego

func _ready():
	cambiar_color_texto(Color(0, 0, 0))
	generar_ejercicio()


func generar_ejercicio():
	var tipo = randi() % 4
	var num1 = (randi() % 9)+1
	var num2 = (randi() % 9)+1
	var operacion = ""
	var resultado = 0

	match tipo:
		0:
			operacion = "+"
			resultado = num1 + num2
		1:
			operacion = "-"
			resultado = num1 - num2
		2:
			operacion = "*"
			resultado = num1 * num2
		3:
			operacion = "/"
			if num2 == 0:
				num2 = 1  # Evitar división por cero
			resultado = num1 / num2

	$Label.text = str(num1) + " " + operacion + " " + str(num2) + " = ?"
	$Label.set_meta("resultado", resultado)

func _process(delta):
	position.y += velocidad * delta  # Mover el Area2D (junto con Sprite2D y Label)
	if position.y > get_viewport().size.y:
		emit_signal("pierde_juego")  # Emitir la señal de pérdida
		queue_free()  # Eliminar el nodo si sale de la pantalla

func cambiar_color_texto(color):
	$Label.modulate = color  # Cambiar el color del texto
