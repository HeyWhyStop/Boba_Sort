extends AnimatableBody2D

@export var platform_num: int = 0
var start_pos = true
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.

func _on_button_1_1_pressed() -> void:
	if start_pos:
		start_pos = false
		animation_player.play("move_" + str(platform_num))


func _on_button_1_2_pressed() -> void:
	if not start_pos:
		start_pos = true
		animation_player.play_backwards("move_" + str(platform_num))
