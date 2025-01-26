extends Control

@export var timer = Timer
@export var label = RichTextLabel
@export var path = ""


func _ready()->void: 
	pass
	#label.set_autowrap_mode(0)	#self.add_child(timer)
	#timer.start(10)
	#timer.connect("timeout",control, "_on_timer_timeout")
	
	
func _process(delta:float)->void:
	label.text = str(ceil(timer.time_left))



func _on_timer_timeout() -> void:
	print("timeout")
	get_tree().change_scene_to_file(path)
	pass # Replace with function body.
