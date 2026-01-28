class_name REmployee extends Resource

enum Position {
	WORKER,
	PUBLIC_RELATIONS
}

@export var name : String
@export var age : int
@export_multiline var description: String
@export var satisfaction_data: RSatisfaction
@export var role: Position
@export var experience_years: int
@export var background: String
@export var education_level: String
