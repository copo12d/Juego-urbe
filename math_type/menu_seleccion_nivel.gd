extends Control

func _ready():
	$btn_nivel_1.pressed.connect(self._on_nivel_1_pressed)
	$btn_nivel_2.pressed.connect(self._on_nivel_2_pressed)
	$btn_nivel_3.pressed.connect(self._on_nivel_3_pressed)
	$btn_nivel_4.pressed.connect(self._on_nivel_4_pressed)
	$ButtonSalir.pressed.connect(self._on_salir_pressed)

func _on_nivel_1_pressed():
	get_tree().change_scene_to_file("res://Level_1.tscn")  

func _on_nivel_2_pressed():
	get_tree().change_scene_to_file("res://Level_2.tscn")
	
func _on_nivel_3_pressed():
	get_tree().change_scene_to_file("res://Level_3.tscn")
	
func _on_nivel_4_pressed():
	get_tree().change_scene_to_file("res://Level_4.tscn")
	
func _on_salir_pressed():
	get_tree().change_scene_to_file("res://menu_principal.tscn")
