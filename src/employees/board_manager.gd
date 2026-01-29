class_name NBoardManager extends Node

@export var employee_manager : NEmployeeManager
@export var board_satisfaction_data : RSatisfaction
# ALL COSTS ARE WEEKLY
var budget : OSatisfaction

@export_group("Business Expenses")
@export var base_production_costs := 35000
@export var base_transportation_costs := 20000
@export var base_marketing_costs := 15000
var production_expense : OModifierStack = OModifierStack.new()
var transportation_expense : OModifierStack = OModifierStack.new()
var marketing_expense : OModifierStack = OModifierStack.new()


@export_group("Business Income")
@export var base_sales_value : int = 1500000
var sales := OModifierStack.new()

func _ready() -> void:
	budget = OSatisfaction.new(board_satisfaction_data)

func get_total_expenses() -> int:
	return production_expense.get_modified_value(base_production_costs)\
	 + transportation_expense.get_modified_value(base_transportation_costs)\
	 + marketing_expense.get_modified_value(base_marketing_costs)\
	 + get_employees_salary_expenses()

func get_employees_salary_expenses() -> int:
	var ret := 0
	for employee : OEmployee in employee_manager.employees:
		ret += employee.data.salary
	return ret
