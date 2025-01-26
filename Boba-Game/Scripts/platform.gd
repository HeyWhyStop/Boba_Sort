extends Node2D

@export var x_move: int = 0
@export var y_move: int = 0
var start: Vector2 = Vector2.ZERO
var end: Vector2 =  Vector2.ZERO
@export var time: float = 1

@onready var platform: AnimatableBody2D = $AnimatableBody2D

var start_pos: bool = true
var moving: bool = false
var tween = null

func _ready() -> void:
	$Button1.position = Vector2(-24, -24)
	$Button2.position = Vector2(x_move-24, y_move-24)


func _on_button_1_pressed() -> void:
	if not start_pos and not moving:
		start_pos = true
		moving = true
		tween = get_tree().create_tween()
		tween.tween_property(platform, "position", platform.position - Vector2(x_move, y_move), time)
		await tween.finished
		moving = false

func _on_button_2_pressed() -> void:
	if start_pos and not moving:
		start_pos = false
		moving = true
		tween = get_tree().create_tween()
		tween.tween_property(platform, "position", platform.position + Vector2(x_move, y_move), time)
		await tween.finished
		moving = false
