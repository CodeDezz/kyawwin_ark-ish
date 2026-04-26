extends CollisionObject3D
class_name Interactable

@export var prompt_message = "Interact"
@export var hunger_restore_amount: float = 20.0

func _on_body_entered(body: Interactable) -> void:
	# Check if the object entering is the player
	if body.has_method("add_hunger"):
		body.add_hunger(hunger_restore_amount)
		queue_free() # Removes the item from the game
