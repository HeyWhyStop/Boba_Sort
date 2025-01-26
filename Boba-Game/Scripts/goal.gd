extends Node2D

@export var scene = ""




func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if!(body.name == "player"): return
	get_tree().change_scene_to_file(scene)
	pass # Replace with function body.
