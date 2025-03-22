extends Node

var walk_sound = preload("res://Art_Assets/Sounds/Walk1.WAV")
var death_sound = preload("res://Art_Assets/Sounds/Death1.wav")
var jump_sound = preload("res://Art_Assets/Sounds/Jump.wav")
var key_sound = preload("res://Art_Assets/Sounds/KeyObtained.wav")

# Global Variables
var viewport: Vector2i = Vector2i(1152, 648)
var music_player: AudioStreamPlayer2D
var sound_player: AudioStreamPlayer2D
var game_version: GameState.Version

# Game Instances
var player: CharacterBody2D
var game_instance: Instance
var game_container: Node

# Signals
@warning_ignore("unused_signal")
signal version_changed(new_state)
@warning_ignore("unused_signal")
signal game_started
@warning_ignore("unused_signal")
signal new_level_entered

# Simple Functions
func play_sound(sound, pitch = true):
	sound_player.stream = sound
	if pitch:
		sound_player.pitch_scale = randf_range(0.8, 1.2)
	sound_player.play()
