extends Area2D

var textures = {
	'coin': 'res://assets/coin.png',
	'key_red': 'res://assets/keyRed.png',
	'star': 'res://assets/star.png'
}

var type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init(_type, _position):
	$Sprite2D.texture = load(textures[_type])
	type = _type
	position = _position
	
func pickup():
	$CollisionShape2D.disabled = true
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(3, 3), 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.set_parallel()
	tween.tween_property($Sprite2D, 'modulate', Color(1, 1, 1, 0), 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT_IN)
	tween.set_parallel(false)
	tween.tween_callback(queue_free)
