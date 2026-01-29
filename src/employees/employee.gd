class_name REmployee extends Resource

enum Position {
	WORKER,
	PUBLIC_RELATIONS
}

enum Seniority {
	NEW,
	SOME_EXPERIENCE,
	EXPERIENCED,
	VERY_EXPERIENCED,
	EXPERT
}

@export var name : String
@export var age : int
@export_multiline var description: String
@export var satisfaction_data: RSatisfaction
@export var position: Position
@export var seniority: Seniority
@export var salary: int
@export var experience_years: int
@export var background: String
@export var education_level: String
