class_name RConsequence extends Resource

enum Target {
	COMPLAINER,
	BUDGET,
	WORKERS,
	PUBLIC_RELATIONS
}

@export var target : Target
@export var value : int
