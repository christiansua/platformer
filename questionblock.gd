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
		
# logic for bumping the block

func bump_block():
	state = State.BUMPED
	$Sprite2D.frame = 1 # switch to the second frame to indicate "used" state
	
	match Global.current_state:
		Global.PlayerState.SMALL:
			Global.spawn_beer_bottle(self.global_position + Vector2(0, -20))
		Global.PlayerState.BIG, Global.PlayerState.THONG:
			Global.spawn_thong_power_up(self.global_position + Vector2(0, -20))
	
	
	
	

	
	bump_upwards()
	var timer = get_tree().create_timer(0.2)
	await timer.timeout
	return_to_original_position()
	
	# moves block upwards
func bump_upwards():
	position.y -=10

#returns block to its original positoin
func return_to_original_position():
	position = original_position
