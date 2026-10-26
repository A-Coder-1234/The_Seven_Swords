extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.z_index = -2


func _on_body_exited(body: Node2D) -> void:
	body.z_index = 0
