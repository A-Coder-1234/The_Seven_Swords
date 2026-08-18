extends CanvasLayer

@export var fps_label: Label

var signal_count : int = 0
var time_passed : float = 0.0

func _ready() -> void:
	print("ready")
	Global.connect("PLAYER_UPDATE", update)

func _process(delta: float) -> void:
	time_passed += delta
	print("bannana")
	
	# Every time 1 full second passes, update the text and reset
	if time_passed >= 1.0:
		print("orrange")
		if fps_label:
			print("apple")
			fps_label.text = "Signal Rate: " + str(signal_count) + " Hz"
		
		# Reset tracking variables for the next second
		signal_count = 0
		time_passed = 0.0

func update() -> void:
	# Increment the count every single time the signal fires
	signal_count += 1
