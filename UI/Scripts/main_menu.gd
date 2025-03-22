extends Control

var game_scene = "res://Scenes/level_0.tscn"
var game

func _ready() -> void:
	# Set focus for start button
	%StartButton.grab_focus.call_deferred()
	pass

func _on_start_button_pressed() -> void:
	# Places level 0 into the Game Container so that earlier references are preserved.
		Global.game_instance.load_level_details(game_scene)

func _on_options_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	# we gotta get outta here
	get_tree().quit()
