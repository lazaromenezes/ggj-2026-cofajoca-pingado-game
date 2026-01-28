class_name CardScene extends Button

signal card_accepted(consequences: Array[RConsequence])
signal card_rejected(consequences: Array[RConsequence])

var card: RCard
var sender: OEmployee

@onready var from: Label = %From
@onready var complaint: RichTextLabel = %Complaint
@onready var overlay: CanvasLayer = %Overlay


func _ready() -> void:
	var format_data := {
		"employee_name": sender.data.name
	}
	
	from.text = sender.data.name
	complaint.text = card.message.format(format_data)


func accept() -> void:
	card_accepted.emit(card.accept_consequences)


func reject() -> void:
	card_rejected.emit(card.reject_consequences)


func _on_close_pressed() -> void:
	overlay.visible = false
	

func _pressed() -> void:
	overlay.visible = true
