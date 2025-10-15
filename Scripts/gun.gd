extends AnimatedSprite2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var node_2d: Node2D = $".."

@onready var marker_2d: Marker2D = $Marker2D2

func _process(delta: float) -> void:
	look_at(get_global_mouse_position()) 

func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
	node_2d.add_child(new_bullet)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		shoot()
#Skjuter när man klickar ner vänstra musknappen
