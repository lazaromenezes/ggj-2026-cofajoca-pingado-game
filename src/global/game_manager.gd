class_name NGameManager extends Node

signal tracker_changed(tracker: Dictionary[TrackerType, float])

@export var date_manager: NDateManger
@export var card_manager: NCardManager
@export var employee_manager: NEmployeeManager

@export var daily_goal: int = 6

enum TrackerType {
	TOTAL_PROFIT,
	WORKERS,# Afinity, still named WORKERS for backwards compatibility
	BUDGET, # Daily Profit, still named BUDGET for backwards compatibility
	DAILY_GOAL
}

class Session:
	var tracker: Dictionary[TrackerType, float] = {
		TrackerType.TOTAL_PROFIT: 0,
		TrackerType.WORKERS: 0,
		TrackerType.BUDGET: 0,
		TrackerType.DAILY_GOAL: 0
	}
	
	var day: int
	
	func move_daily_to_total() -> void:
		tracker[TrackerType.TOTAL_PROFIT] += tracker[TrackerType.BUDGET]
		tracker[TrackerType.BUDGET] = 0

var current_session: Session

func start() -> void:
	date_manager.day_advanced.connect(_on_day_advanced)
	date_manager.advance_day()
	current_session = Session.new()
	current_session.day = date_manager.day
	tracker_changed.emit(current_session.tracker)


func next_employee() -> OEmployee:
	return employee_manager.get_available_employee()


func get_day_cards() -> Array[RCard]:
	var available_cards := card_manager.available_cards.duplicate()
	available_cards.shuffle()
	return available_cards.slice(0, daily_goal)


func on_card_action(consequences: Array[RConsequence]) -> void:
	for consequence in consequences:
		current_session.tracker[consequence.target] += consequence.value
	
	tracker_changed.emit(current_session.tracker)


func next_day() -> void:
	date_manager.advance_day()
	
func _on_day_advanced(day: int) -> void:
	if current_session:
		current_session.move_daily_to_total()
		current_session.day += 1
