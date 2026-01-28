class_name NDateManger extends Node

signal day_advanced(day: int)

var day := 0

func advance_day() -> void:
	day += 1
	day_advanced.emit(day)
