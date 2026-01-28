extends Control

@onready var game_manager: NGameManager = $GameManager
@onready var notes_space: GridContainer = %NotesSpace
@onready var date_manager: NDateManger = $DateManager

@export var card_scene: PackedScene

func _ready() -> void:
	date_manager.day_advanced.connect(_on_day_advanced)
	game_manager.start()


func _place_card(card: RCard) -> void:
	var employee: OEmployee = game_manager.next_employee()
	
	var card_object: CardScene = card_scene.instantiate()
	
	card_object.card = card
	card_object.sender = employee
	card_object.card_accepted.connect(game_manager.on_card_action)
	card_object.card_rejected.connect(game_manager.on_card_action)
	card_object.card_accepted.connect(on_card_action.bind(card_object))
	card_object.card_rejected.connect(on_card_action.bind(card_object))
	notes_space.add_child(card_object)
	

func on_card_action(_consequences: Array[RConsequence], card_object: CardScene) -> void:
	card_object.queue_free()
	if notes_space.get_child_count() == 1:
		date_manager.advance_day()
	

func _on_day_advanced(_day: int) -> void:
	for card in game_manager.get_day_cards():
		_place_card(card)
