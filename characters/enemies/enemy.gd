extends "res://characters/character.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_move = false
	facing = moves.keys()[randi() % 4]
	await get_tree().create_timer(0.5).timeout
	can_move = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move:
		if not move(facing) or randi() % 10 > 5:
			facing = moves.keys()[randi() % 4]
