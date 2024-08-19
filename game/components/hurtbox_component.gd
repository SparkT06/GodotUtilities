class_name HurtboxComponent extends Area2D

@export var healthComponnet : HealthComponent

var Damage : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(OnAreaEntered)


func OnAreaEntered(otherArea : Area2D) -> void:
	if not otherArea is HitboxComponent : return
	if healthComponnet == null : return
	var hitBoxComponent = otherArea as HitboxComponent
	healthComponnet.Damage(hitBoxComponent.Damage)
