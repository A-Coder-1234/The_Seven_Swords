extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if "Is_entity" in body:
		body.z_index = 1
		# mask
		body.set_collision_mask_value(1, false)
		body.set_collision_mask_value(3, true)
		# layer
		body.set_collision_layer_value(1, false)
		body.set_collision_layer_value(3, true)

func _on_body_exited(body: Node2D) -> void:
	if "Is_entity in body":
		body.z_index = 0
		# mask
		body.set_collision_mask_value(1, true)
		body.set_collision_mask_value(3, false)
		# layer
		body.set_collision_layer_value(1, true)
		body.set_collision_layer_value(3, false)
