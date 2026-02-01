extends PanelContainer

@export var card_scene: CardScene

@export var accept_texture: Texture2D
@export var reject_texture: Texture2D

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data == "accept" or data == "reject"

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data == "accept":
		var stamp := _add_stamp(at_position, accept_texture)
		_tween_stamp(stamp, card_scene.accept)
	elif data == "reject":
		var stamp := _add_stamp(at_position, reject_texture)
		_tween_stamp(stamp, card_scene.reject)

func _add_stamp(at_position: Vector2, texture: Texture2D) -> Sprite2D:
	var stamp: Sprite2D = Sprite2D.new()
	stamp.texture = texture
	stamp.modulate = Color8(255, 255, 255, 0)
	add_child(stamp)
	stamp.position = at_position
	stamp.rotate(deg_to_rad(randf_range(-15, 15)))
	return stamp

func _tween_stamp(stamp: Sprite2D, callback: Callable) -> void:
	var tween := get_tree().create_tween()
	tween.tween_property(stamp, "modulate:a", 1, 0.25)
	tween.tween_callback(callback)
