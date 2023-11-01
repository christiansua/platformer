extends Area2D

enum State { UNBUMPED, BUMPED }
var state: int = State.UNBUMPED
var original_position: Vector2
func _ready():
	original_position = position
# signal handler for body_entered

func _on_body_entered(body):
	if body.is_in_group("Player") and state == State.UNBUMPED:
		bump_block()
		

