class_name GameCamera2D extends Node2D

@onready var shaky_camera: ShakyCamera = $ShakyCamera

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shake() -> void:
	shaky_camera.shake()
