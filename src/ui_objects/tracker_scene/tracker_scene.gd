extends GridContainer

@export var game_manager: NGameManager

@onready var daily_profit_label: Label = %DailyProfit
@onready var afinity_label: Label = %Afinity
@onready var total_profit_label: Label = %TotalProfit
@onready var day_label: Label = %Day

func _ready() -> void:
	game_manager.tracker_changed.connect(_on_tracker_changed)
	game_manager.date_manager.day_advanced.connect(_on_day_advanced)


func _on_tracker_changed(tracker: Dictionary[NGameManager.TrackerType, float]) -> void:
	_populate_fields(tracker)


func _on_day_advanced(day: int) -> void:
	day_label.text = str(day)
	

func _populate_fields(tracker: Dictionary[NGameManager.TrackerType, float]) -> void:
	daily_profit_label.text = str(tracker[NGameManager.TrackerType.BUDGET])
	afinity_label.text = str(tracker[NGameManager.TrackerType.WORKERS])
	total_profit_label.text = str(tracker[NGameManager.TrackerType.TOTAL_PROFIT])
