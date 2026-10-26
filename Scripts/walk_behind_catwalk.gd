extends Area2D


func _on_body_exited(body: Node2D) -> void:
	if "Is_entity" in body:
		# mask
		body.set_collision_mask_value(1, true)
		body.set_collision_mask_value(2, false)
		# layer
		body.set_collision_layer_value(1, true)
		body.set_collision_layer_value(2, false)


func _on_body_entered(body: Node2D) -> void:
	if "Is_entity" in body:
		# mask
		body.set_collision_mask_value(1, false)
		body.set_collision_mask_value(2, true)
		# slayer
		body.set_collision_layer_value(1, false)
		body.set_collision_layer_value(2, true)
