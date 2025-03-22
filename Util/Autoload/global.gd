extends Node

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
signal version_changed(new_state)
signal new_level_entered
