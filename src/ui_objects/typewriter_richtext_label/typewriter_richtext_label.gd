extends RichTextLabel

@onready var sound_effect_player: AudioStreamPlayer2D = $SoundEffectPlayer

@export var typing_time: float = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible_ratio = 0


func _on_visibility_changed() -> void:
	if is_visible_in_tree():
		sound_effect_player.play()
		var tween := get_tree().create_tween()
		tween.tween_property(self, "visible_ratio", 1, typing_time)
		tween.tween_callback(sound_effect_player.stop)
	else:
		sound_effect_player.stop()
		self.visible_ratio = 0
