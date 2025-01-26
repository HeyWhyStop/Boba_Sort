extends Node

var bbl_sort_maker

signal start_swap(first, second)
var index1
var index2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bbl_sort_maker = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("swapping indexes", index1, "and", index2)
	Swapper.start_swap.emit(index1, index2)
	pass # Replace with function body.
	
func set_indexes(first: int, second: int):
	index1 = first
	index2 = second
