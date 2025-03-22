extends Node2D
class_name Instance

var current_level_details: PackedScene

func _ready() -> void:
	Global.game_instance = self
	Global.music_player = $MusicPlayer
	Global.sound_player = $SoundPlayer
	Global.game_container = $Game

## Changes the Game State between ALPHA and BETA.
## This will focus the game on what needs to be synced to what. 
func change_state(new_state: GameState.Version):
	Global.version_changed.emit(new_state)

func pick_next_state():
	Global.game_version += 1
	if Global.game_version >= GameState.Version.size():
		Global.game_version = 1
	Global.version_changed.emit(Global.game_version)

func setup_level():
	var new_level = current_level_details.instantiate()
	Global.game_container.add_child(new_level)

func restart_level():
	setup_level()
	Global.level_restarted.emit()
	
func load_level_details(scene):
	for entry in Global.game_container.get_children():
		entry.queue_free()
	current_level_details = load(scene)
	setup_level()
