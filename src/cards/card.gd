class_name RCard extends Resource

@export_multiline() var message : String
@export var accept_consequences : Array[RConsequence]
@export var reject_consequences : Array[RConsequence]
@export var min_day : int = 1
@export var event_name: String
@export var sender_type: Definitions.SenderType
