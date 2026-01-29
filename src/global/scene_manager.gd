extends Node

var title: PackedScene = preload("res://src/screens/title/title.tscn")
var office: PackedScene = preload("res://src/screens/office/office.tscn")
var profile: PackedScene = preload("res://src/screens/credits/credits.tscn")
var options: PackedScene = preload("res://src/screens/options/options.tscn")

enum Scene {
	TITLE,
	OFFICE,
	CREDITS,
	OPTIONS
} 

var scene_map: Dictionary[Scene, PackedScene] = {
	Scene.TITLE: title,
	Scene.OFFICE: office,
	Scene.CREDITS: profile,
	Scene.OPTIONS: options
}

var _stage: Control
var _viewport_width: float

func set_stage(stage: Control) -> void:
	_stage = stage
	_viewport_width = stage.get_viewport_rect().size.x

func switch_to(target_scene: Scene, on_start: Callable = Callable()) -> void:
	if not _stage:
		printerr("Stage not defined")
		return
	
	var target: Control = scene_map[target_scene].instantiate()
	target.position.x = _viewport_width
	
	if _stage.get_child_count() > 0:
		_stage.add_child(target)
		
		var old_scene := _stage.get_child(0, false)
		
		var tween := get_tree().create_tween()
		tween.tween_property(target, 'position:x', 0, 0.25)
		tween.parallel().tween_property(old_scene, 'position:x', -_viewport_width, 0.25)
		await tween.finished
		
		old_scene.queue_free()
	else:
		_stage.add_child(target)
		
		var tween := get_tree().create_tween()
		tween.tween_property(target, 'position:x', 0, 0.25)
		await tween.finished
	
	if on_start.is_valid():
		on_start.call(target)
