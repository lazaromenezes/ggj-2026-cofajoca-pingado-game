extends Control

@onready var game_manager: NGameManager = $GameManager
@onready var card_container: Control = %CardContainer

@export var card_scene: PackedScene

func _ready() -> void:
	game_manager.start()
	
	_show_card()

func _show_card() -> void:
	var card: RCard = game_manager.next_card()
	var employee: OEmployee = game_manager.next_employee()
	
	var card_object: CardScene = card_scene.instantiate()
	
	card_object.card = card
	card_object.sender = employee
	card_object.card_accepted.connect(game_manager.on_card_action)
	card_object.card_rejected.connect(game_manager.on_card_action)
	card_object.card_accepted.connect(on_card_action.bind(card_object))
	card_object.card_rejected.connect(on_card_action.bind(card_object))
	card_container.add_child(card_object)

func on_card_action(_consequences: Array[RConsequence], card_object: CardScene) -> void:
	card_object.queue_free()
	_show_card()
