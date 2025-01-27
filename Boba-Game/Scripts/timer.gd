extends Control

@onready var bar: TextureProgressBar = $TextureProgressBar

@export var time: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bar.value = 100

func _process(delta: float) -> void:
	bar.value -= (100/time) * delta
