extends Area2D

# Target sprites
@onready var Top_wall = $"../../../../../Y_sorting_container/Y_sorting_fort_sceens/Left_fort/Fort_L_top_wall"
@onready var Top_door = $"../../../Fort_sceenes/Fort_gate_l_top"
@onready var Bottom_door = $"../../../Fort_sceenes/Fort_gate_l_bottom"

func _on_body_entered(body: Node2D) -> void:
	if "Is_entity" in body:
		Top_wall.visible = false
		Top_door.visible = false
		Bottom_door.visible = false


func _on_body_exited(body: Node2D) -> void:
	if "Is_entity" in body:
		Top_wall.visible = true
		Top_door.visible = true
		Bottom_door.visible = true
