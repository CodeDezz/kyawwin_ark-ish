extends CharacterBody3D

@export var speed: float = 6.0
@export var step_size: float = 3.0  # Distance of one step
var steps_taken: int = 0
var move_direction: Vector3 = Vector3.ZERO

func _ready():
	_choose_new_direction()

func _physics_process(delta):
	# Calculate distance to move this frame
	var move_vec = move_direction * speed * delta
	
	# Move the character
	var collision = move_and_collide(move_vec)
	
	# Check if we've traveled a "step"
	# For simplicity, we track steps by distance or a timer. 
	# Here, we use a simple timer logic to switch every few seconds/steps
	if steps_taken >= 6:
		_choose_new_direction()
		steps_taken = 0

func _choose_new_direction():
	var directions = [Vector3.FORWARD, Vector3.BACK, Vector3.LEFT, Vector3.RIGHT]
	move_direction = directions[randi() % directions.size()]
	
	# To simulate "8 steps" exactly, you could use a Tween 
	# or a Timer to call this function periodically.
