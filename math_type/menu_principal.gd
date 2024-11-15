extends Control

func _ready():
	$ButtonIniciar.pressed.connect(self._on_iniciar_pressed)
	$ButtonSalir.pressed.connect(self._on_salir_pressed)

func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://Menu_seleccion_nivel.tscn")  # Cambia de vuelta a la escena principal

func _on_salir_pressed():
	get_tree().quit()  # Sale del juego
