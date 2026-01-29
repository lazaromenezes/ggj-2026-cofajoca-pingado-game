class_name OModifierStack extends Object

var modifiers : Array[RModifier]

func add_modifier(p_modifier: RModifier) -> void:
	modifiers.append(p_modifier)

func get_modified_value(p_value: int) -> int:
	var ret := p_value
	modifiers.sort_custom(sort_modifiers)
	for modifier in modifiers:
		modifier.apply(ret)
	return ret

func sort_modifiers(a: RModifier, b: RModifier) -> bool:
	if a.type == b.type:
		return false
	return a.type == RModifier.Type.FLAT
