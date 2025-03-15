extends Node2D

enum GameState { GS_NONE, GS_ALPHA, GS_BETA }
var game_state: GameState

func _ready() -> void:
	Global.game_instance = $Game
	Global.game_camera = $Camera2D
	Global.music_player = $MusicPlayer
	Global.sound_player = $SoundPlayer

## Changes the Game State between ALPHA and BETA.
## This will focus the game on what needs to be synced to what. 
func change_state(new_state):
	game_state = new_state
	emit_signal("version_changed", new_state)

func pick_next_state():
	pass
