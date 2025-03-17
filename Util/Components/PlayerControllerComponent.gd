extends Node
class_name PlayerControllerComponent

# Dependencies
@export var move_component: MoveComponent
@export var animation_component: AnimationComponent

func _process(_delta) -> void:
	var horizontal_move = Input.get_axis("move_left","move_right")
	var vertical_move = Input.get_axis("move_up", "move_down")
	if move_component:
		move_component.entity.velocity.x = horizontal_move
		move_component.climb_ladder(vertical_move)
		
		if Input.is_action_just_pressed("move_jump"):
			move_component.jump_input()
		
		if Input.is_action_just_pressed("move_swap_version"):
			Global.pick_next_state()
