class_name StampButton extends Control

@export var value: String

func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview := Label.new()
	preview.text = value
	set_drag_preview(preview)
	return value.to_lower()
