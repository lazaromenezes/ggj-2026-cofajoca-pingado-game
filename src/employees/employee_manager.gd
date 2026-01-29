class_name NEmployeeManager extends Node

@export var date_manager : NDateManager
@export var employees_path : String


var employees : Array[OEmployee]

func _ready() -> void:
	date_manager.on_advance_day.connect(handle_advance_day)
	var employee_data_list : Array[REmployee] 
	employee_data_list.assign(GUtils.load_resources(employees_path))
	for employee_data in employee_data_list:
		employees.append(OEmployee.new(employee_data))

func handle_advance_day(_day: int) -> void:
	for employee in employees:
		if employee.on_leave_days > 0:
			employee.on_leave_days -= 1

func filter_available_employees(a: OEmployee) -> bool:
	if a.on_leave_days > 0\
	 or a.current_day_complaint_count >= a.max_complaints_per_day:
		return false
	return true

func get_available_employee() -> OEmployee:
	var ret : OEmployee = employees.filter(filter_available_employees).pick_random()
	ret.current_day_complaint_count += 1
	return ret

func get_employees_by_position(p_position: REmployee.Position) -> Array[OEmployee]:
	var ret : Array[OEmployee]
	for employee in employees:
		if employee.data.position == p_position:
			ret.append(employee)
	return ret
