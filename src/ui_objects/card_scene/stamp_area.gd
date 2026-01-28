extends Panel

@export var card_scene: CardScene

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data == "accept" or data == "reject"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data == "accept":
		card_scene.accept()
	elif data == "reject":
		card_scene.reject()
