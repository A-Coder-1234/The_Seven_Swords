extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if "Is_entity" in body:
		body.z_index = 1


func _on_body_exited(body: Node2D) -> void:
	if "Is_entity" in body:
		body.z_index = 0
