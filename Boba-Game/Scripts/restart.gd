extends Node

@export var scene = ""

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(scene)


func _on_pressed() -> void:
	get_tree().change_scene_to_file(scene)
	pass # Replace with function body.
