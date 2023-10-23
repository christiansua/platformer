extends CharacterBody2D


const SPEED = 25

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Set the hortizontal velocity to a constant negative value to m
	velocity.x = -SPEED
	
	update_animation()
	move_and_slide()
func update_animation():
	animated_sprite_2d.play("hop")
