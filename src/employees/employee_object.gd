class_name OEmployee extends Object

var data : REmployee
var satisfaction: OSatisfaction
var on_leave_days: = 0
var max_complaints_per_day: = 2
var current_day_complaint_count := 0
func _init(p_data: REmployee) -> void:
	data = p_data
	satisfaction = OSatisfaction.new(p_data.satisfaction_data)
