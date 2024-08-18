class_name GameCamera extends Camera2D

@export var acceleration : float = 5

var player_position: Node2D
var target_postion: Vector2 = Vector2.ZERO

func _ready() -> void:
	make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	acquire_target()
	global_position = global_position.lerp(target_postion, 1.0 - exp(-delta* acceleration))
	
func acquire_target() -> void:
	player_position = get_tree().get_first_node_in_group("Player")
	if player_position != null:
		target_postion = player_position.global_position
		
