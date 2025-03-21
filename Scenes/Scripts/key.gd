extends Area2D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animPlayer.play("FloatAnim")
	
func _obtained():
	animPlayer.play("ObtainedAnim")
