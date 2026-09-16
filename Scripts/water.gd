extends Area2D
var overlaping_bodies = get_overlapping_bodies()
var is_water: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	overlaping_bodies = get_overlapping_bodies()
	for body in overlaping_bodies:
		if "z_depth" in body:
			print("yay")
			if body.z_depth == -4:
				body.in_water = true

#func _on_body_exited(body: Node2D) -> void:
#	if "z_depth" in body:
#		if body.z_depth == -4:
#			body.in_water = false
