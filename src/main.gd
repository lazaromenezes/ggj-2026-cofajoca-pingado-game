extends Control

@onready var stage: Control = %Stage
@onready var card_parser: NCardParser = $CardParser

func _ready() -> void:
	SceneManager.set_stage(stage)
	card_parser.parse_data()
	await SceneManager.switch_to(SceneManager.Scene.TITLE)
