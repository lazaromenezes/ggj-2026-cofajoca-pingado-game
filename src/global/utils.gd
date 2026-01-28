class_name GUtils extends Node

static func load_resources(path: String) -> Array:
	var ret : Array
	for file in ResourceLoader.list_directory(path):
		ret.append(ResourceLoader.load(path + '\\' + file))
	return ret

static func load_json(path: String) -> Variant:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Could not open file")
		return null

	var content := file.get_as_text()
	file.close()

	return JSON.parse_string(content)
