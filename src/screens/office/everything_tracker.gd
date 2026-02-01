class_name NEverythingTracker extends Node

signal game_over()

@export var date_manager : NDateManger

@export var board_satisfaction : int

@export var employee_satisfaction: int

@export var budget_target_initial : int
var budget_target : int
var budget: int

# End game tracker
var negative_budget_days : int

func _ready() -> void:
	budget_target = budget_target_initial
	date_manager.day_advanced.connect(_on_day_advanced)
func calculate_buget_target() -> void:
	var modifier := lerpf(0.7, 1.3, board_satisfaction / 100.0)
	budget_target = int(budget_target_initial * modifier)

func check_game_over() -> void:
	if negative_budget_days >= 2:
		trigger_game_over()

func trigger_game_over() -> void:
	game_over.emit()

func _on_day_advanced(_day: int) -> void:
	budget = 0
	if budget < 0:
		negative_budget_days += 1
	else:
		negative_budget_days = 0
	check_game_over()
	calculate_buget_target()
