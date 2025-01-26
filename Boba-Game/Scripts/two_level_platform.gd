extends AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var up = true


func _on_button_pressed() -> void:
	if up:
		animation_player.play("move_down")
	if not up:
		animation_player.play("move_up")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "move_down":
		up = false
	if anim_name == "move_up":
		up = true
	
