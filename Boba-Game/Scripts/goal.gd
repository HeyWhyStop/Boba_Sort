extends StaticBody2D

@export var scene: String = ""

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body.name == "player":
		print("goal")
		print(scene)
		get_tree().change_scene_to_file(scene)
