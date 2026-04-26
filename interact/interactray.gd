extends RayCast3D
@onready var prompt: Label = $prompt


func _physics_process(_delta: float) -> void:
	
	if is_colliding():
		var collider = get_collider()
		prompt.text = "detecting " + collider.name
		
	else:
		prompt.text = ""
