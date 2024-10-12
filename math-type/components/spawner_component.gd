class_name SpawnerComponent
extends Node2D

@export var Scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn(global_position: Vector2, father = get_tree().current_scene):
	var mob = Scene.instantiate()
	father.add_child(mob)
	
	pass
