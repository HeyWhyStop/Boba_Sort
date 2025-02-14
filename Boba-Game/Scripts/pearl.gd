extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var wall_check: ShapeCast2D = $WallCheck

@export var spawn_point: Vector2 = Vector2(0,0)

var speed : int = 100
var flip: int = -1


func _physics_process(delta: float) -> void:
	velocity.x = speed * flip
	
	$Sprite2D.rotate((flip)*0.07)
	is_on_wall()
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if ray_cast_2d.get_collider() == null:
		flip *= -1
		ray_cast_2d.position.x *= -1
		print(ray_cast_2d.get_collider())
	else:
		pass
	
	move_and_slide()

func _on_reset_button_pressed() -> void:
	position = spawn_point
