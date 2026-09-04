extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_request_attention()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	body.z_index = 102

func _on_body_exited(body: Node2D) -> void:
	if "z_depth" in body:
		if body.z_depth == 0:
			if body.position.x > 29 and body.position.x < 643:
				body.z_index = 100
	else:
		if "z_depth" in body:
			if body.z_depth == 0:
				body.z_index = 100
