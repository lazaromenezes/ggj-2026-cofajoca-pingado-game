extends Node

@export var employees_path : String
var employees : Array[OEmployee]

func _ready() -> void:
	var employee_data_list : Array[REmployee] 
	employee_data_list.assign(GUtils.load_resources(employees_path))
	for employee_data in employee_data_list:
		employees.append(OEmployee.new(employee_data))
