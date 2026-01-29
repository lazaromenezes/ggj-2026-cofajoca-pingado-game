class_name NCardManager extends Node

@export var employee_manager : NEmployeeManager
@export var card_pool_path : String
@export var date_manager : NDateManager

var card_pool : Array[RCard]
var available_cards : Array[RCard]

func _ready() -> void:
	card_pool.assign(GUtils.load_resources(card_pool_path))
	date_manager.on_advance_day.connect(handle_new_day)

func handle_new_day(current_day: int) -> void:
	card_pool.append_array(available_cards)
	available_cards.resize(0)
	var card_pool_copy : Array[RCard] = card_pool.duplicate()
	for card : RCard in card_pool_copy:
		if card.min_day >= current_day:
			available_cards.append(card)
			card_pool.erase(card)

func get_card() -> RCard:
	return available_cards.pick_random()

func apply_card_consequences(p_card: RCard, accepted: bool, p_complainer: OEmployee) -> void:
	var consequences := p_card.accept_consequences if accepted else p_card.reject_consequences
	for consequence in consequences:
		apply_consequence(consequence, p_complainer)

func apply_consequence(p_consequence: RConsequence, p_complainer: OEmployee) -> void:
	match p_consequence.target:
		RConsequence.Target.COMPLAINER:
			p_complainer.satisfaction.modifiers.add_modifier(p_consequence.modifier)
		RConsequence.Target.WORKERS:
			apply_consequence_to_group(p_consequence.modifier, REmployee.Position.WORKER)
		RConsequence.Target.PUBLIC_RELATIONS:
			apply_consequence_to_group(p_consequence.modifier, REmployee.Position.PUBLIC_RELATIONS)

func apply_consequence_to_group(p_modifier: RModifier, p_position: REmployee.Position) -> void:
	for employee in employee_manager.get_employees_by_position(p_position):
		employee.satisfaction.modifiers.add_modifier(p_modifier)
