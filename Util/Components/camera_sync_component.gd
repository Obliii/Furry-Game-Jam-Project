extends SyncComponent
class_name CameraSyncComponent

# For the scene cameras

func _on_global_version_changed(new_state: GameState.Version) -> void:
	# Nothing too big here
	# We want to look at the scene that matches the version we're on
	if new_state == version:
		target.enabled = true
	else:
		target.enabled = false
