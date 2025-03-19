extends Node
class_name SyncComponent
# For tracking a linked entity in the opposite version of the game
# Stops the attached entity from processing when the version doesn't match the current gamestate

@export var version : GameState.Version = GameState.Version.GS_BETA
@export var synced_object: Node2D

var target: Node2D

func _ready() -> void:
	# sync_component needs to know when the version changes
	target = get_parent()
	Global.version_changed.connect(_on_global_version_changed)
	
func _on_global_version_changed(_new_state: GameState.Version) -> void:
	# If the version matches - start processing our own behaviours
	# if the version doesn't match - instead we sync our properties with the synced object
	# EXPANSION - Extend from "SyncComponent" to sync different groups of stats.
	# ie - movement only, on-off, custom things
	pass
