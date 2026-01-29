extends Control


func _on_back_pressed() -> void:
	await SceneManager.switch_to(SceneManager.Scene.TITLE)
