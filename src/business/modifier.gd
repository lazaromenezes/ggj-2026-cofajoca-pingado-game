class_name RModifier extends Resource

enum Type {
	FLAT,
	PERCENT
}

@export var type : Type
@export var value : int

func apply(p_value: int) -> int:
	if type == Type.FLAT:
		return p_value + value
	elif Type.PERCENT:
		return int(p_value * (1.0 + value / 100.0))
	else:
		return INF
