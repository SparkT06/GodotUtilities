@tool
class_name ShakyCamera extends Camera2D

@export var camera_acceleration : float = 5
@export var shake_noise: FastNoiseLite
@export var max_shake_offset: float = 20
@export var shake_decay: float = 5
@export var frequency_multiplier: float = 100
@export var use_exponential_decay: bool = false

var player_position: Node2D
var target_postion: Vector2 = Vector2.ZERO

var current_noise_value: float = 0
var current_shake_percentage = 0;
var current_direction_rotation = 0


func _ready():
	make_current()
	if shake_noise == null:
		shake_noise = FastNoiseLite.new()
		shake_noise.noise_type = FastNoiseLite.TYPE_PERLIN
		shake_noise.seed = randi()
		shake_noise.fractal_octaves = 1
		shake_noise.frequency = .01


func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_postion, 1.0 - exp(-delta* camera_acceleration))
	if current_shake_percentage > 0:
		current_noise_value = wrapf(current_noise_value + delta, 0, 1000)
		var noise_x = shake_noise.get_noise_2d(current_noise_value * frequency_multiplier, 0)
		var noise_y = shake_noise.get_noise_2d(0, current_noise_value * frequency_multiplier)
		
		var offset_x = noise_x * max_shake_offset
		var offset_y = noise_y * max_shake_offset

		offset = Vector2(offset_x, offset_y) * current_shake_percentage
		if use_exponential_decay:
			offset *= current_shake_percentage

	current_shake_percentage = max(current_shake_percentage - (shake_decay * delta), 0)


func shake(percent: float = 1.0):
	current_shake_percentage = clamp(current_shake_percentage + percent, 0, 1)

func acquire_target() -> void:
	player_position = get_tree().get_first_node_in_group("Player")
	if player_position != null:
		target_postion = player_position.global_position
		
