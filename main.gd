extends Control

@onready var game_manager: NGameManager = $GameManager
@onready var notes_space: GridContainer = %NotesSpace

@export var card_scene: PackedScene

func _ready() -> void:
	game_manager.start()
	
	for card in game_manager.get_day_cards():
		_place_card(card)


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
