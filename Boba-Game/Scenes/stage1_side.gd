extends AnimatableBody2D

var left : bool = false

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"


func _on_left_button_pressed() -> void:
	if not left:
		left = true
		animation_player.play("move_left")
	
	
func _on_right_button_pressed() -> void:
	if left:
		left = false
		animation_player.play_backwards("move_left")
