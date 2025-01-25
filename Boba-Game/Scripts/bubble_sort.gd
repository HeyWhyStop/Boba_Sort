extends Node

@export var size = 5

var size_arr = []
var bubble_tower_base = load("res://Scenes/bubble_tower_test.tscn");
var bbl_arr = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#bubble_tower_base = self.get_child(0)
	#print(bubble_tower_base.name)
	var random = RandomNumberGenerator.new()
	while(size_arr.size() < size):
		var rand_int = random.randi_range(1, size)
		if(size_arr.find(rand_int) < 0):
			size_arr.append(rand_int)
			var child = bubble_tower_base.instantiate()
			child.position.x = self.position.x
			child.position.y = self.position.y
			bbl_arr.append(child)
			self.add_child(bbl_arr[-1])
			self.position.x += 200
			print(bbl_arr[-1].name)
	
	for i in size_arr:
		print(i);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
	
func duplicate_up(iterations: int) -> void:
	pass
	
func duplicate_across(iterations: int) -> void:
	pass
