extends Node2D

@export var x_move: int = 0
@export var y_move: int = 0
@export var time: float = 1

var start_pos: bool = true
var moving: bool = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button1.position = Vector2(0-24,0-24)
	$Button2.position = Vector2(x_move-24, y_move-24)
	var animation = animation_player.get_animation("move")
	animation.length = time
	animation.track_insert_key(0, 0, Vector2(0, 0))
	animation.track_insert_key(0, time, Vector2(x_move, y_move))

func _on_button_1_pressed() -> void:
	if not start_pos and not moving:
		start_pos = true
		moving = true
		animation_player.play_backwards("move")

func _on_button_2_pressed() -> void:
	if start_pos and not moving:
		start_pos = false
		moving = true
		animation_player.play("move")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "move":
		moving = false
