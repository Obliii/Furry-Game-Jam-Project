extends Node
class_name MoveComponent

# Dependencies
@export var animation_component: AnimationComponent
@export var entity: CharacterBody2D
@export var collider: CollisionShape2D
@export var move_speed := 200.0
@export var jump_height := -250.0
@export var sustained_jump_strength := -25.0
@export var air_time_max = 0.3
var air_time = 0.0
var jump_held: bool = false
var climbing_ladder := false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	calculate_gravity(delta)
	jump_input()
	entity.move_and_slide()

## Calculates the amount of time the player should fly up before they start descending. 
func calculate_gravity(delta):
	if not entity.is_on_floor() and not climbing_ladder:
		entity.velocity.y += gravity * delta

	if (entity.is_on_floor() or climbing_ladder) and not jump_held:
		air_time = 0
	elif air_time <= air_time_max:
		air_time += delta

## Entity is able to press and hold the jump button for a maximum of three seconds.
func jump_input():
	if Input.is_action_just_pressed("move_jump") and is_grounded():
		jump_held = true
		climbing_ladder = false
	if Input.is_action_just_released("move_jump") or not is_grounded():
		jump_held = false
	
	if jump_held and air_time <= 0.15:
		entity.velocity.y = jump_height
	if jump_held:
		entity.velocity.y += sustained_jump_strength

## Entity is able to climb the ladder. Their gravity is temporarily removed and they will be placed
## on the center of the ladder.
func climb_ladder(vertical_move):
	# TODO: Pass much of this onto the ladder with an Area2D detecting the player.
	if (vertical_move != 0) and true:
		if Global.game_version == GameState.Version.GS_BETA:
			entity.velocity.y = 0
			climbing_ladder = true
			jump_held = false
	

func move_entity(direction):
	entity.velocity.x = direction * move_speed

func is_grounded() -> bool:
	if air_time < air_time_max:
		return true
	else:
		return false
