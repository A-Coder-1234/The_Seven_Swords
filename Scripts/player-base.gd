extends CharacterBody2D

# Declares this node is an entity
const Is_entinity = true
# Defines allegiance
var Team = "Good"

# Defines important variables
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

func _process(_delta: float) -> void:
	
	# Move Player
	# 0.25 degrees is the window for each of the 8 directions on the joy stick
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
