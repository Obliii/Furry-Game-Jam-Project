extends Node2D

func _ready() -> void:
	Global.game_instance = $Game
	Global.game_camera = $Camera2D
	Global.music_player = $MusicPlayer
	Global.sound_player = $SoundPlayer

## Changes the Game State between ALPHA and BETA.
## This will focus the game on what needs to be synced to what. 
func change_state(new_state: GameState.Version):
	Global.version_changed.emit(new_state)

func pick_next_state():
	Global.game_version += 1
	if Global.game_version >= GameState.Version.size():
		Global.game_version = 1
	Global.version_changed.emit(Global.game_version)
