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
	if body.position.x > 32 and body.position.x < 640:
		body.z_index = 98
		print("Down")
		print(body.position.x)
	else:
		body.z_index = 100
		print("Out")
		print(body.position.x)
