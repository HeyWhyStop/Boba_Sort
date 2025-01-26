extends CharacterBody2D

var speed : int = 100

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var wall_check: ShapeCast2D = $WallCheck

func _physics_process(delta: float) -> void:
	velocity.x = speed * Global.flip
	
	$Sprite2D.rotate((Global.flip)*0.07)
	is_on_wall()
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if ray_cast_2d.get_collider() == null:
		Global.flip *= -1
		ray_cast_2d.position.x *= -1
		print(ray_cast_2d.get_collider())
	else:
		pass
	
	move_and_slide()
