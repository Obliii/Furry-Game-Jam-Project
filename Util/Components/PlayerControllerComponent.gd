extends Node
class_name PlayerControllerComponent

# Dependencies
@export var move_component: MoveComponent
@export var animation_component: AnimationComponent

func _ready() -> void:
	GameState.player = get_parent()

func _process(_delta) -> void:
	var move = Input.get_axis("move_left","move_right")
	if move_component:
		move_component.entity.velocity = move
		
		if Input.is_action_just_pressed("move_jump"):
			move_component.jump()
		
		if Input.is_action_just_pressed("move_swap_version"):
			GameState.pick_next_state()
