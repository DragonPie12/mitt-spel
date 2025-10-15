extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var speed : float = 600
var target_position
var despawn_time = 1
var is_started : bool = false

func _ready() -> void:
	despawn()

func _physics_process(delta: float) -> void:
	velocity = target_position * speed
	move_and_slide()

func despawn():
	await get_tree().create_timer(despawn_time).timeout
	queue_free()
