extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if "z_depth" in body:
		if body.z_depth > -4 and body.z_depth < 1000:
			body.fall_distance = body.z_depth - -4
			print(body.fall_distance)
