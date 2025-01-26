extends Node

#@export var scale = 1

@export var size = 5
@export var dist_x = 21
@export var dist_y = 22
@export var button_y = 12

#var sorted = false

var size_arr = []
var bubble_tower_base = load("res://Scenes/bubble_tower_test.tscn")
var swapper = load("res://Scenes/swapper.tscn")
var bbl_arr = []
@export var wall = Node2D
#@export var wall_visible = false
#var button_arr = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wall = self.get_child(0)
	wall.visible = false
	#dist_x *= scale
	#dist_y *= scale
	#button_y *= scale
	
	#bubble_tower_base = self.get_child(0)
	#print(bubble_tower_base.name)
	var random = RandomNumberGenerator.new()
	while(size_arr.size() < size):
		var rand_int = random.randi_range(1, size)
		if(size_arr.find(rand_int) < 0):
			size_arr.append(rand_int)
			var child = bubble_tower_base.instantiate()
			child.init(dist_y, size_arr[-1], self.position.x, 0)
			#child.get_script().size = self.size - 1
			#child.position.x = self.position.x
			#child.position.y = self.position.y
			bbl_arr.append(child)
			self.add_child(bbl_arr[-1])
			child.copy_up()
			self.position.x += dist_x
			print(bbl_arr[-1].name)
			
	
	if !Swapper.is_connected("start_swap", swap):
		Swapper.start_swap.connect(swap)
	for i in range(size - 1):
		var button = swapper.instantiate();
		self.add_child(button)
		button.position.y = button_y
		button.position.x = (bbl_arr[i].position.x + bbl_arr[i + 1].position.x) / 2
		button.get_child(0).set_indexes(i, i + 1)
	
	for i in size_arr:
		print(i);
	pass # Replace with function body.

func swap(first: int, second: int) -> void:
	var temp_size = size_arr[first]
	var tower1_x = bbl_arr[first].position.x
	var tower2_x = bbl_arr[second].position.x
	
	
	print("swapping sizes ", size_arr[first], " and ", size_arr[second])
	#var temp_tower_first = bubble_tower_base.instantiate()
	#temp_tower_first.init(dist_y, size_arr[first], bbl_arr[second].position.x, -dist_y)
	#var temp_tower_second = bubble_tower_base.instantiate()
	#temp_tower_second.init(dist_y, size_arr[second], bbl_arr[first].position.x, -dist_y)
	#self.add_child(temp_tower_first)
	#self.add_child(temp_tower_second)
	#bbl_arr[first].visible = false
	#bbl_arr[second].visible = false
	#bbl_arr[first].set_process(false)
	#bbl_arr[second].set_process(false)
	#bbl_arr[first].free()
	#bbl_arr[second].free()
	#var timer = Timer.new()
	#timer.set_wait_time(0.5)
	#timer.start()

	
	#bbl_arr[first].position.x = bbl_arr[second].position.x
	#bbl_arr[first].position.y = bbl_arr[second].position.y
	#bbl_arr[second].position.x = temp_tower_x
	#bbl_arr[second].position.x = temp_tower_y
	
	#var temp_tower = bubble_tower_base.instantiate()
	#temp_tower.init(dist_y, size_arr[first], self.position.x, -dist_y)
	#var temp_tower = bbl_arr[first]
	
	#bbl_arr[first] = temp_tower_second
	#bbl_arr[second] = temp_tower_first
	
	var temp_tower = bbl_arr[first]
	bbl_arr[first] = bbl_arr[second]
	bbl_arr[second] = temp_tower
	bbl_arr[first].position.x = tower1_x
	bbl_arr[second].position.x = tower2_x
	
	size_arr[first] = size_arr[second]
	size_arr[second] = temp_size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if(wall_visible):
		#wall.visible = true
	#else:
		#wall.visible = false
	for i in range(size_arr.size() - 1):
		if(size_arr[i] < size_arr[i + 1]):
			wall.visible = true
			print("not sorted")
			return
	wall.visible = false
	print("sorted!")
	
	pass
	
	
func duplicate_up(iterations: int) -> void:
	pass
	
func duplicate_across(iterations: int) -> void:
	pass
