class_name HealthComponent extends Node

signal EntityDied(position :Vector2)

@export var max_health : float = 10
var current_health: float

func _ready() -> void:
	current_health = max_health

func damage(damage :float):
	current_health = max(current_health - damage, 0)
	Callable(check_death).call_deferred()
	
func check_death():
	if current_health == 0:
		EntityDied.emit(self.global_position)
		owner.queue_free()
