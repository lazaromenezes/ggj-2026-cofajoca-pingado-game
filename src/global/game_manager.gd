class_name NGameManager extends Node

signal tracker_changed(tracker: Dictionary[TrackerType, float])

@export var date_manager: NDateManger
@export var card_manager: NCardManager
@export var employee_manager: NEmployeeManager

enum TrackerType {
	COMPLAINER,
	BUDGET,
	WORKERS,
	PUBLIC_RELATIONS
}

class Session:
	var tracker: Dictionary[TrackerType, float] = {
		TrackerType.COMPLAINER: 0,
		TrackerType.BUDGET: 0,
		TrackerType.WORKERS: 0,
		TrackerType.PUBLIC_RELATIONS: 0,
	}
	
	var day: int

var current_session: Session

func start() -> void:
	date_manager.advance_day()
	current_session = Session.new()
	current_session.day = date_manager.day
	tracker_changed.emit(current_session.tracker)
	
func next_card() -> RCard:
	return card_manager.get_card()
	
func next_employee() -> OEmployee:
	return employee_manager.get_available_employee()

func on_card_action(consequences: Array[RConsequence]) -> void:
	for consequence in consequences:
		current_session.tracker[consequence.target] += consequence.value
	
	tracker_changed.emit(current_session.tracker)
