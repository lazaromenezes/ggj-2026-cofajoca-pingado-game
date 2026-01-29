class_name NDateManager extends Node

signal on_advance_day(day: int)

var day := 1

func _ready() -> void:
	pass # Replace with function body.

func advance_day() -> void:
	day += 1
	on_advance_day.emit(day)
