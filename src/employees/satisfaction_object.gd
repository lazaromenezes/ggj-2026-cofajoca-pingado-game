class_name OSatisfaction extends Object

signal satisfaction_level_changed(satisfaction_level: RSatisfaction.SatisfactionLevel)

var current_satisfaction_level : RSatisfaction.SatisfactionLevel
var satisfaction: int
var satisfaction_data: RSatisfaction

func change_satisfaction(value: int) -> void:
	satisfaction += value
	var satisfaction_map := satisfaction_data.get_satisfaction_map()
	for satisfaction_level in satisfaction_map:
		if value < satisfaction_map[satisfaction_level]\
		 and satisfaction_level != current_satisfaction_level:
			current_satisfaction_level = satisfaction_level
			satisfaction_level_changed.emit(current_satisfaction_level)

func _init(p_satisfaction_data: RSatisfaction) -> void:
	satisfaction_data = p_satisfaction_data
	satisfaction = p_satisfaction_data.start_value
	current_satisfaction_level = RSatisfaction.SatisfactionLevel.CONTENT
