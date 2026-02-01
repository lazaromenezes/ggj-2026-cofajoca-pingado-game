extends CanvasLayer

@export var animated_sprites: Array[AnimatedSprite2D]

func  _ready() -> void:
	for sprite in animated_sprites:
		sprite.play()
