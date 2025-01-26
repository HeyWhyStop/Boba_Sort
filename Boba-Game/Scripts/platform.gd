extends Node2D

@export var x_move: int = 0
@export var y_move: int = 0
@export var time: float = 1

#@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var platform: AnimatableBody2D = $AnimatableBody2D

var start_pos: bool = true
var moving: bool = false
var tween = null

func _ready() -> void:
	$Button1.position = Vector2(0-24, 0-24)
	$Button2.position = Vector2(x_move-24, y_move-24)
	var tween = get_tree().create_tween()
	pass


func _on_button_1_pressed() -> void:
	if not start_pos and not moving:
		start_pos = true
		moving = true
		tween = get_tree().create_tween()
		tween.tween_property(platform, "position", Vector2(0, 0), time).from(Vector2(x_move, y_move))
		await tween.finished
		moving = false


func _on_button_2_pressed() -> void:
	if start_pos and not moving:
		start_pos = false
		moving = true
		tween = get_tree().create_tween()
		tween.tween_property(platform, "position", Vector2(x_move, y_move), time).from(Vector2(0, 0))
		await tween.finished
		moving = false
