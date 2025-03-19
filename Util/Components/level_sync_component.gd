extends SyncComponent
class_name LevelSyncComponent
	
func _on_global_version_changed(new_state: GameState.Version) -> void:
	# For the base level scenes (alpha and beta) - literally hides the entire scene
	# Hope they don't get mismatched and we get a screen flicker
	if new_state == version:
		target.visible = true
	else:
		target.visible = false
