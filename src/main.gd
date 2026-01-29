extends Control

@onready var stage: Control = %Stage

func _ready() -> void:
	SceneManager.set_stage(stage)
	await SceneManager.switch_to(SceneManager.Scene.TITLE)
