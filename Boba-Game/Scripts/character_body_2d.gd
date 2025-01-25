extends CharacterBody2D

var speed : int = 100

@onready var wall_check: ShapeCast2D = $WallCheck

func _physics_process(delta: float) -> void:
	velocity.x = speed * Global.flip
	
	$Sprite2D.rotate((Global.flip)*0.07)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
