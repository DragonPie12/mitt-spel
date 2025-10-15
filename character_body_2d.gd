extends CharacterBody2D

var speed = 200
# ändra variabeln för att göra snabbare eller långsamare

# _physics_process(delta): händer varje fream
func _physics_process(delta):
	var input_vector := Vector2.ZERO
# Vector2 betyder (, ) och ZERO setter de till 0 (0, 0)

	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
# ändrar vektorn till om höger (1, 0) och både up och höger (1, -1)

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
# om jag trycker up och höger så åker den inte dubelt snabbt

	velocity = input_vector * speed
	move_and_slide()
# tar det som står i vektorn alltså (1, 0) och gångrar den med speed alltså 3 och då rör sig gubben 3 tiles 
