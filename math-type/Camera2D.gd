extends Node2D

func _ready():
	var sprite = $Sprite2D  # Asegúrate de que este nombre coincide con el nombre de tu nodo Sprite
	var camera = sprite.get_node("Camera2D")  # Asegúrate de que Camera2D sea hijo del Sprite2D

	# Calcular el zoom basado en el tamaño del Sprite y la resolución deseada
	var viewport_size = get_viewport().size
	var sprite_size = sprite.texture.get_size() * sprite.scale
	var zoom_factor = Vector2(viewport_size.x / sprite_size.x, viewport_size.y / sprite_size.y)
	
	# Aplicar el zoom a la cámara
	camera.zoom = zoom_factor

	# Hacer que la cámara siga al Sprite y establecerla como la actual
	camera.make_current()
	camera.position = sprite.position