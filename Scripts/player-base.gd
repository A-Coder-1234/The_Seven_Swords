extends CharacterBody2D

var direction: int = 3
var velocity_Y: float = 0.0
var velocity_X: float = 0.0
var exelorate_by = 30
var anim_cycle: float = 0.0
var player_cords: Vector2 = Vector2(0, 0)
var dir = Input.get_vector("Left", "Right", "Forward", "Back")
var frame_count: float = 0.0
var last_dir: Vector2 = Vector2(0, 0)
var current_dir: Vector2 = Vector2(0, 0)
var angle: float = 0.0
var degrees: float = 0.0
var z_depth: int = 0
var fall_distance: int = 0
var units_to_fall: int = 0
var units_fallen: int = 0
var fall_unit: int = 250
var fall_steps: int = 2

# Frame count is for tracking the current frame and last_dir will store the direction each frame so the program can find out if the direction has changed and reset the frame counter.

func _ready() -> void:
	Global.connect("PLAYER_UPDATE", update)
	
func update():
	
# Move Player
	# 0.25
	# Create input vector
	dir = Input.get_vector("Left", "Right", "Forward", "Back")
	
	# Cache last direction
	last_dir = current_dir
	
	if not Input.is_action_pressed("Sprint"):
		
	# Check direction X
		if dir.x > 0.25:
			velocity.x += exelorate_by
			current_dir.x = 1
		elif dir.x < -0.25:
			velocity.x -= exelorate_by
			current_dir.x = -1
		elif dir.y > 0.25 or dir.y < -0.25:
			current_dir.x = 0
		
	# Check direction y
		if dir.y > 0.25:
			velocity.y += exelorate_by
			current_dir.y = -1
		elif dir.y < -0.25:
			velocity.y -= exelorate_by
			current_dir.y = 1
		elif dir.x > 0.25 or dir.x < -0.25:
			current_dir.y = 0
	
	else:
	
		# Check direction X
		if dir.x > 0.25:
			velocity.x += exelorate_by*2
			current_dir.x = 1
		elif dir.x < -0.25:
			velocity.x -= exelorate_by*2
			current_dir.x = -1
		elif dir.y > 0.25 or dir.y < -0.25:
			current_dir.x = 0
		
	# Check direction y
		if dir.y > 0.25:
			velocity.y += exelorate_by*2
			current_dir.y = -1
		elif dir.y < -0.25:
			velocity.y -= exelorate_by*2
			current_dir.y = 1
		elif dir.x > 0.25 or dir.x < -0.25:
			current_dir.y = 0
	
	# Calculate falling logic
	if fall_distance > 0:
		if units_to_fall == 0:
			units_to_fall = fall_distance * fall_steps
		if units_fallen == units_to_fall:
			z_depth -= fall_distance
			units_to_fall = 0
			units_fallen = 0
			fall_distance = 0
		else:
			velocity.x = 0
			velocity.y = fall_unit
			units_fallen += 1
	
	# Update player cords
	player_cords.x += velocity.x
	player_cords.y += velocity.y
	
	# Move player on screen
	move_and_slide()
	
	# Decrease velocity by half
	velocity.x /= 2
	velocity.y /= 2
	# The velocity will take to long to reach 0 so if it is close enough this rounds it to 0.
	if velocity.x < 0.001 and velocity.x > -0.001:
		velocity.x = 0
	if velocity.y < 0.001 and velocity.y > -0.001:
		velocity.y = 0
	
	#Animate Player
	
	# Update frame count
	frame_count += 1
	if frame_count > 28:
		frame_count = 0
	
	# Change direction
	if velocity.x != 0 or velocity.y != 0:
		if 	current_dir.x == 1:
			$Body.animation = "Walk right"
			$Clotheing.animation = "Walk right"
			$Hair.animation = "Walk right"
		elif current_dir.x == -1:
				$Body.animation = "Walk left"
				$Clotheing.animation = "Walk left"
				$Hair.animation = "Walk left"
		elif current_dir.y == 1:
				$Body.animation = "Walk backward"
				$Clotheing.animation = "Walk backward"
				$Hair.animation = "Walk backward"
		elif current_dir.y == -1:
			$Body.animation = "Walk forward"
			$Clotheing.animation = "Walk forward"
			$Hair.animation = "Walk forward"
	else:
		if 	current_dir.x == 1:
			$Body.animation = "Idle right"
			$Clotheing.animation = "Idle right"
			$Hair.animation = "Idle right"
		elif current_dir.x == -1:
				$Body.animation = "Idle left"
				$Clotheing.animation = "Idle left"
				$Hair.animation = "Idle left"
		elif current_dir.y == 1:
				$Body.animation = "Idle backward"
				$Clotheing.animation = "Idle backward"
				$Hair.animation = "Idle backward"
		elif current_dir.y == -1:
			$Body.animation = "Idle forward"
			$Clotheing.animation = "Idle forward"
			$Hair.animation = "Idle forward"
	
	# Apply the animation
	if velocity.x != 0 or velocity.y != 0:
		$Body.frame = frame_count/6
		$Clotheing.frame = frame_count/6
		$Hair.frame = frame_count/6
	else:
		$Body.frame = 0
		$Clotheing.frame = 0
		$Hair.frame = 0
	print(z_depth)
