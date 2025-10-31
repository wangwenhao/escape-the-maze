extends "res://characters/character.gd"

signal moved

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move:
		for dir in moves.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal('moved')


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('enemies'):
		emit_signal('dead')
	if area.has_method('pickup'):
		area.pickup()
	if area.type == 'key_red':
		emit_signal('grabbed_key')
	if area.type == 'star':
		emit_signal('win')
