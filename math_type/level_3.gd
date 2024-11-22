extends Node2D

# Definir variables para el puntaje y enemigos generados
var enemigos_generados = 0
var max_enemigos = 20
var puntaje = 20  # Iniciar el puntaje en 20
var min_puntaje = 10  # Si el puntaje baja de 10, termina el juego

func _ready():
	# Ajustar tamaño de la ventana
	DisplayServer.window_set_size(Vector2(425, 600))

	# Ajustar tamaño del Sprite2D de fondo
	var fondo = $Sprite2D
	var ventana_size = Vector2(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	var texture_size = fondo.texture.get_size()
	fondo.scale = ventana_size / texture_size

	# Configurar Timer y conectar señal
	$LineEdit.grab_focus()

func _on_timer_timeout() -> void:
	# Verificar si ya hemos spawneado el número máximo de enemigos
	if enemigos_generados < max_enemigos:
		var ejercicio_scene = preload("res://ejercicios_3.tscn")
		var ejercicio = ejercicio_scene.instantiate()
		add_child(ejercicio)

		# Asegurar que el ejercicio no se posicione demasiado cerca de los bordes
		var max_x = get_viewport().size.x - 100  # Dejar un margen de 100 píxeles
		var posicion_x = randi() % max_x
		ejercicio.position = Vector2(posicion_x, 0)
		
		# Conectar la señal de pérdida del juego usando Callable
		ejercicio.connect("pierde_juego", Callable(self, "_on_pierde_juego"))
		# Incrementar el contador de enemigos generados
		enemigos_generados += 1
	else:
		_on_gana_juego()
		# Detener el Timer si hemos alcanzado el número máximo de enemigos
		$Timer.stop()

func _on_line_edit_text_submitted(new_text: String) -> void:
	for hijo in get_children():
		if hijo is Area2D:
			var resultado = hijo.get_node("Label").get_meta("resultado")
			if resultado == int(new_text):
				hijo.queue_free()  # Eliminar el ejercicio si la respuesta es correcta
				$LineEdit.clear()  # Limpiar el campo de texto
				return
			else:
				$LineEdit.clear()  # Limpiar el campo de texto
func _on_gana_juego():
	print(puntaje," ",enemigos_generados)
	if enemigos_generados>=20 && puntaje>=10:
		get_tree().change_scene_to_file("res://win.tscn")  # Cambia a una escena de fin del juego


func _on_pierde_juego():
	puntaje -= 1
	print("Puntaje reducido a: ", puntaje)  # Mensaje de depuración
	if puntaje < min_puntaje:
		get_tree().change_scene_to_file("res://gameover3.tscn")  # Cambia a una escena de fin del juego
