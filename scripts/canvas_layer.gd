extends CanvasLayer

@onready var hungertime: Timer = $hungertime
@onready var progress_bar: ProgressBar = $VBoxContainer/ProgressBar


@onready var  maxhunger: int = 100
@onready var currenthunger: int = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hungertime.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currenthunger = hungertime.time_left
	if currenthunger <= 0: 
		get_tree().reload_current_scene()

	progress_bar.value = currenthunger
	progress_bar.max_value = maxhunger
