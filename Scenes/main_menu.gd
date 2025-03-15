extends Control

func _ready() -> void:
	# Set focus for start button
	$PanelContainer/MarginContainer/VBoxContainer/QuitButton.grab_focus.call_deferred()
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://ellxio420wg0")
	pass # Replace with function body.

func _on_options_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
