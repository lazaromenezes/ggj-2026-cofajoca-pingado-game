class_name OEmployee extends Object

var data : REmployee
var satisfaction: OSatisfaction

func _init(p_data: REmployee) -> void:
	data = p_data
	satisfaction = OSatisfaction.new(p_data.satisfaction_data)
