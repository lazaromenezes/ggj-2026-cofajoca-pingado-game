extends GridContainer

@export var game_manager: NGameManager

@onready var budget_label: Label = %Budget
@onready var workers_label: Label = %Workers
@onready var public_label: Label = %Public
@onready var day_label: Label = %Day

func _ready() -> void:
	game_manager.tracker_changed.connect(_on_tracker_changed)
	game_manager.date_manager.day_advanced.connect(_on_day_advanced)


func _on_tracker_changed(tracker: Dictionary[NGameManager.TrackerType, float]) -> void:
	_populate_fields(tracker)


func _on_day_advanced(day: int) -> void:
	day_label.text = str(day)
	

func _populate_fields(tracker: Dictionary[NGameManager.TrackerType, float]) -> void:
	budget_label.text = str(tracker[NGameManager.TrackerType.BUDGET])
	workers_label.text = str(tracker[NGameManager.TrackerType.WORKERS])
	public_label.text = str(tracker[NGameManager.TrackerType.PUBLIC_RELATIONS])
