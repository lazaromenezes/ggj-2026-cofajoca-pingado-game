class_name StampButton extends TextureRect

@export var value: String
@export var preview_texture: Texture2D

func _get_drag_data(_at_position: Vector2) -> Variant:
	_create_preview()
	return value.to_lower()

func _create_preview() -> void:
	var preview := TextureRect.new()
	preview.texture = preview_texture
	set_drag_preview(preview)
