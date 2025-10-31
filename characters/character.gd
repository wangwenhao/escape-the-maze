extends Area2D

@export var speed: int

var tile_size = 64
var can_move = true
var facing = 'right'
var moves = {
	'right': Vector2(1, 0),
	'left': Vector2(-1, 0),
	'up': Vector2(0, -1),
	'down': Vector2(0, 1),
}

@onready var raycasts = {
	'right': $RayCastRight,
	'left': $RayCastLeft,
	'up': $RayCastUp,
	'down': $RayCastDown,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(dir):
	#$AnimationPlayer.speed_scale = speed
	facing = dir
	if raycasts[facing].is_colliding():
		return
	
	can_move = false
	$AnimationPlayer.play(facing)
	var move_tween = get_tree().create_tween()
	print(position)
	move_tween.tween_property(self, "position", position + moves[facing] * tile_size, 1.0 / speed)#.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	move_tween.tween_callback(set_can_move_true)
	#move_tween.play()
	return true
	
func set_can_move_true():
	can_move = true
