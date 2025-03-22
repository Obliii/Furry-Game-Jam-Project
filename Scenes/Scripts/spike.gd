extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.play_sound(Global.death_sound)
		Global.game_instance.restart_level()
