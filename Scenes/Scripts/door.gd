extends StaticBody2D

@export var associated_key: Area2D

func _ready() -> void:
	# Connect the key to the door so that this could be removed.
	associated_key.body_entered.connect(_body_entered)

## If the player enters, the door and the key disappears. This will be changed as soon as I get the assets!
func _body_entered(body: Node2D):
	if body.name == "BetaPlayer" or "AlphaPlayer":
		queue_free()
		if associated_key:
			associated_key.queue_free()
			
