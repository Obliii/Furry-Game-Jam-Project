extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collider: CollisionShape2D = $CollisionShape2D

# Dependencies
@export var alpha_animation_sprite: SpriteFrames
@export var beta_animation_sprite: SpriteFrames

# Initialize the player and give Global a reference to it.
func _ready():
	Global.player = self
	Global.version_changed.connect(_on_version_changed)
	sprite.sprite_frames = beta_animation_sprite
	
func _on_version_changed(new_version):
	pass
