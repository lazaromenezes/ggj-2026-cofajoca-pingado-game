class_name NCardManager extends Node

@export var card_pool_path : String
@export var date_manager : NDateManger

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
