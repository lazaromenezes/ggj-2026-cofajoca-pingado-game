extends Control

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	await SceneManager.switch_to(SceneManager.Scene.CREDITS)


func _on_options_pressed() -> void:
	await SceneManager.switch_to(SceneManager.Scene.OPTIONS)


func _on_play_pressed() -> void:
	await SceneManager.switch_to(SceneManager.Scene.OFFICE)
