extends Area2D

@onready var animation_controller = $AnimationPlayer

func key_obtained():
	animation_controller.play("key-falling")
	Global.play_sound(Global.key_sound)

func _on_animation_player_animation_finished() -> void:
	queue_free()
