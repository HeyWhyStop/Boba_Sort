extends Node

var bubble_sort_base = load("res://Scenes/bubble_tower_test.tscn")
@export var wall = Node2D
#var parent = self.get_parent().get_script()
#var parent_script
var dist_y
var size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#parent_script = self.get_parent().get_script()
	#size = parent_script.size - 1
	#dist_y = parent_script.dist_y
	print(self.name)
	#var child_node = self.get_child(0)
	#print(child_node.name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func init(other_dist_y, other_size, pos_x, pos_y, can_bounce = false) -> void:
	self.position.x = pos_x
	self.position.y = pos_y
	dist_y = other_dist_y
	size = other_size
	print("size = ", size)
func copy_up():
	if(size <= 1):
		return
	var copy = bubble_sort_base.instantiate()
	copy.init(dist_y, size - 1, 0, -dist_y)
	#copy.position.x = self.position.x
	#copy.position.y = self.position.y + dist_y
	#copy.get_script().size = self.size - 1
	#copy.get_script().dis_y = self.dist_y
	self.add_child(copy)
	copy.copy_up()
	pass
	
