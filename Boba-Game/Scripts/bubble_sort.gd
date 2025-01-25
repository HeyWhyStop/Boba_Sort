extends Node

@export var size = 5

var bubble_arr = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random = RandomNumberGenerator.new()
	while(bubble_arr.size() < size):
		var rand_int = random.randi_range(1, size)
		if(bubble_arr.find(rand_int) < 0):
			bubble_arr.append(rand_int)
	
	for i in bubble_arr:
		print(i);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
	
func duplicate_up(iterations: int) -> void:
	pass
	
func duplicate_across(iterations: int) -> void:
	pass
