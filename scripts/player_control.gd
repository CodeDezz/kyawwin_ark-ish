extends CharacterBody3D

@onready var head_2: Node3D = $head2

@export var speed: float = 15.0


@export var sprinting_speed: float = 12.0
@export var jump_velocity: float = 10.0
@export var mouse_sens: float = 0.4
var lerp_speed: float = 5

var direction = Vector3.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var input_dir := Input.get_vector("left","right","forward","backword")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head_2.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head_2.rotation.x = clampf(head_2.rotation.x,deg_to_rad(-98),deg_to_rad(98))

	
