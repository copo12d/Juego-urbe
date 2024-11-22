extends Control

	

func _ready():
	$ButtonSalir.pressed.connect(self._on_salir_pressed)

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Menu_seleccion_nivel.tscn")  # Cambia de vuelta a la escena principal
