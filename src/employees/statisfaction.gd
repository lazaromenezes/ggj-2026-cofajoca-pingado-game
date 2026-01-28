class_name RSatisfaction extends Resource

enum SatisfactionLevel {
	MISERABLE,
	UNHAPPY,
	NEUTRAL,
	CONTENT,
	HAPPY
}

@export var min_value: int
@export var max_value: int
@export var start_value: int

@export_group("Tresholds")
@export var miserable_threshold: int
@export var unhappy_threshold: int
@export var neutral_threshold: int
@export var content_threshold: int
@export var happy_threshold: int

var satisfaction_map: Dictionary[SatisfactionLevel, int] = {}
func get_satisfaction_map() -> Dictionary[SatisfactionLevel, int]:
	if satisfaction_map.is_empty():
		satisfaction_map = {
		SatisfactionLevel.MISERABLE: miserable_threshold,
		SatisfactionLevel.UNHAPPY: unhappy_threshold,
		SatisfactionLevel.NEUTRAL: neutral_threshold,
		SatisfactionLevel.CONTENT: content_threshold,
		SatisfactionLevel.HAPPY: happy_threshold
	}
	return satisfaction_map
