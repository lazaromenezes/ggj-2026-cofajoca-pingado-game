class_name RConsequence extends Resource

enum Target {
	COMPLAINER,
	WORKERS,
	PUBLIC_RELATIONS,
	SALES,
	PRODUCTION_COSTS,
	TRANSPORTATION_COSTS,
	MARKETING_COSTS
}
@export var target : Target
@export var modifier : RModifier
