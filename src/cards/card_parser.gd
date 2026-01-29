class_name NCardParser extends Node

@export var card_json_path: String
@export var card_object_path: String

func _ready() -> void:
	var cards_data : Array = GUtils.load_json(card_json_path)
	delete_existing_cards(card_object_path)
	var count := 0
	for card : Dictionary in cards_data:
		var result := ResourceSaver.save(parse_card_data(card), card_object_path + '\\complaint_%d.tres' % [count])
		print(result)
		count +=1

func delete_existing_cards(path: String) -> void:
	var dir := DirAccess.open(path)
	var files := DirAccess.get_files_at(path)
	for file in files:
		dir.remove(file)
	

func parse_card_data(card_data: Dictionary) -> RCard:
	var card := RCard.new()

	card.message = card_data.get("message", "")
	card.min_day = card_data.get("min_day", 0)

	card.accept_consequences = []
	for c : Dictionary in card_data.get("accept_consequences", []):
		var consequence := RConsequence.new()
		#consequence.target = c.get("target", RConsequence.Target.COMPLAINER)
		consequence.modifier = parse_modifier(c["modifier"] as Dictionary)
		card.accept_consequences.append(consequence)

	card.reject_consequences = []
	for c : Dictionary in card_data.get("reject_consequences", []):
		var consequence := RConsequence.new()
		#consequence.target = c.get("target", RConsequence.Target.COMPLAINER)
		consequence.modifier = parse_modifier(c["modifier"] as Dictionary)
		card.reject_consequences.append(consequence)

	return card

func parse_modifier(p_modifier: Dictionary) -> RModifier:
	#{ "type": "FLAT", "value": -25 }
	var new_mod := RModifier.new()
	if p_modifier["type"] == "FLAT":
		new_mod.type = RModifier.Type.FLAT
	elif p_modifier["type"] == "PERCENT":
		new_mod.type = RModifier.Type.PERCENT
	new_mod.value = p_modifier["value"]
	return new_mod
