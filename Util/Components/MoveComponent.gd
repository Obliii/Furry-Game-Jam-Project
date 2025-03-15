extends Node
class_name MoveComponent

# Dependencies
@export var animation_component: AnimationComponent
@export var entity: PhysicsBody2D
@export var move_speed := 100.0
@export var jump_height := 15.0
@export var air_time : float :
	set(value):
		if air_time < 0:
			air_time = 0

func _physics_process(delta: float) -> void:
	if air_time > 0:
		air_time -= delta
	entity.move_and_collide(entity.velocity * move_speed * delta)

func jump():
	pass

func climb_ladder():
	pass
