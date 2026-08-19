extends AnimatedSprite2D

var direction: int = 3
var velocity_Y: float = 0.0
var velocity_X: float = 0.0
var velocity: Vector2 = Vector2(0, 0)
var anim_cycle: float = 0
var player_cords: Vector2 = Vector2(0, 0)
var dir = Input.get_vector("Left", "Right", "Forward", "Back")
var frame_count: float = 0
var last_dir: Vector2 = Vector2(0, 0)
var current_dir: Vector2 = Vector2(0, 0)
var angle: float = 0
var degrees: float = 0

# Frame count is for tracking the current frame and last_dir will store the direction each frame so the program can find out if the direction has changed and reset the frame counter.

func _ready() -> void:
	Global.connect("PLAYER_UPDATE", update)
	
func update():
	
# Move Player
	# 0.25
	# Create input vector
	dir = Input.get_vector("Left", "Right", "Forward", "Back")
	#print(dir)
	
	# Cache last direction
	last_dir = current_dir
	
	if not Input.is_action_pressed("Sprint"):
		
	# Check direction X
		if dir.x > 0.25:
			velocity.x += 0.6
			current_dir.x = 1
		elif dir.x < -0.25:
			velocity.x -= 0.6
			current_dir.x = -1
		elif dir.y > 0.25 or dir.y < -0.25:
			current_dir.x = 0
		
	# Check direction y
		if dir.y > 0.25:
			velocity.y += 0.6
			current_dir.y = -1
		elif dir.y < -0.25:
			velocity.y -= 0.6
			current_dir.y = 1
		elif dir.x > 0.25 or dir.x < -0.25:
			current_dir.y = 0
	
	else:

		# Check direction X
		if dir.x > 0.25:
			velocity.x += 1
			current_dir.x = 1
		elif dir.x < -0.25:
			velocity.x -= 1
			current_dir.x = -1
		elif dir.y > 0.25 or dir.y < -0.25:
			current_dir.x = 0
		
	# Check direction y
		if dir.y > 0.25:
			velocity.y += 1
			current_dir.y = -1
		elif dir.y < -0.25:
			velocity.y -= 1
			current_dir.y = 1
		elif dir.x > 0.25 or dir.x < -0.25:
			current_dir.y = 0	
	
	#print(velocity)
	#velocity.x = 0
	#velocity.y = 0
	
	#Check for input
	#if Input.is_action_pressed("Forward"):
		#velocity_Y += 0.5
		# print("Forward")
	#elif Input.is_action_pressed("Back"):
		#velocity_Y -= 0.5
		# print("Back")
	#elif Input.is_action_pressed("Right"):
		#velocity_X += 0.5
		# print("Right")
	#elif Input.is_action_pressed("Left"):
		#velocity_X -= 0.5
		# print("Left")
	
	# Update player cords
	player_cords.x += velocity.x
	player_cords.y += velocity.y
	
	#angle = atan2(player_cords.y, player_cords.x)
	#degrees = angle * (180/PI)
	#current_dir = round(degrees/45) % 8
	
	# Calcule the directon the player is is faceing
	# Will only change if the player moved
	# The warn is ok because this is just computeing an angle and does not need a float level of presision. It also must return a hole number.
	# If anyone knows how to dissable the warning pleas do so.
	#if player_cords.x != 0 and player_cords.y != 0:
		#angle = atan2(player_cords.x, player_cords.y)
		#degrees = angle * (180/PI)
		#current_dir = round(degrees/45) % 8
		#print("change")
	print(frame_count)
	
	#print(player_cords)
	
	# Decrease velocity by half
	velocity.x /= 2
	velocity.y /= 2
	# The velocity will take to long to reach 0 so if it is close enough this rounds it to 0.
	if velocity.x < 0.001 and velocity.x > -0.001:
		velocity.x = 0
	if velocity.y < 0.001 and velocity.y > -0.001:
		velocity.y = 0
	
	#velocity_X = 0
	#velocity_Y = 0
	
	#Update velocity X
	#if velocity_X > 0:
		#velocity_X -= 0.05
	#if velocity_X < 0:
		#velocity_X += 0.05
	# Update velocity Y
	#if velocity_Y > 0:
		#velocity_Y -= 0.05
	#elif velocity_Y <0:
		#velocity_Y += 0.05
	
	# Move player on screen
	position += player_cords
	player_cords = Vector2(0,0)
	
	
	
	
	
#Animate Player
	
	# Update frame count
	frame_count += 1
	#if frame_count > 28:
		#frame_count = 0
	# If the player changed directon reset the frame count
	#if dir.x == 1:
		#if dir.x != last_dir.x:
			#frame_count = 0
	#elif dir.x == -1:
		#if dir.x != last_dir.x:
			#frame_count = 0
	#elif dir.y != last_dir.y:
		#frame_count = 0
	if frame_count > 28:
		frame_count = 0
	
	# Change direction
	if velocity.x != 0 or velocity.y != 0:
		if 	current_dir.x == 1:
			animation = "Walk right"
			$Clotheing.animation = "Walk right"
			$Hair.animation = "Walk right"
		elif current_dir.x == -1:
				animation = "Walk left"
				$Clotheing.animation = "Walk left"
				$Hair.animation = "Walk left"
		elif current_dir.y == 1:
				animation = "Walk backward"
				$Clotheing.animation = "Walk backward"
				$Hair.animation = "Walk backward"
		elif current_dir.y == -1:
			animation = "Walk forward"
			$Clotheing.animation = "Walk forward"
			$Hair.animation = "Walk forward"
	else:
		if 	current_dir.x == 1:
			animation = "Idle right"
			$Clotheing.animation = "Idle right"
			$Hair.animation = "Idle right"
		elif current_dir.x == -1:
				animation = "Idle left"
				$Clotheing.animation = "Idle left"
				$Hair.animation = "Idle left"
		elif current_dir.y == 1:
				animation = "Idle backward"
				$Clotheing.animation = "Idle backward"
				$Hair.animation = "Idle backward"
		elif current_dir.y == -1:
			animation = "Idle forward"
			$Clotheing.animation = "Idle forward"
			$Hair.animation = "Idle forward"
	
	# Apply the animation
	# The warning is ok but I don't know how to catch errors
	if velocity.x != 0 or velocity.y != 0:
		frame = frame_count/6
		$Clotheing.frame = frame_count/6
		$Hair.frame = frame_count/6
	else:
		frame = 0
		$Clotheing.frame = 0
		$Hair.frame = 0

#func _process(delta: float) -> void:
	#if direction > 0:
		#if direction == 1:
			#pass
		#elif direction == 2:
			#pass
		#elif  direction == 3:
			#pass
		#elif direction == 4:
			#pass

#func _input(event):
	#if event.is_action_pressed()
	
