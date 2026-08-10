extends Node2D


func _process(delta: float) -> void:
	Global.PLAYER_UPDATE.emit()
