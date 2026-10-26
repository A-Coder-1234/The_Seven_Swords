extends CharacterBody2D

# Declares this node is an entity
const Is_entinity = true
# Defines allegiance
var Team = "Bad"

var Speed = 20
var Chaseing_target = false
var Target = null

func _physics_process(_delta: float) -> void:
	if Chaseing_target:
		print("good/yay")
		position += (Target.position - position) / Speed


func _on_detection_range_body_entered(body: Node2D) -> void:
	if "Is_entity" in body:
		if body.Team == Team:
			Target = body
			Chaseing_target = true


func _on_detection_range_body_exited(body: Node2D) -> void:
	if "Is_entity" in body:
		if Target == body:
			Target = null
			Chaseing_target = false
