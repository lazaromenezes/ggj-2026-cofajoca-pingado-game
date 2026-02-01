extends Node2D

@export var sprite_frames: SpriteFrames
@export var min_move_time: float = 2
@export var max_move_time: float = 10

@export var min_wait_time: float = 5
@export var max_wait_time: float = 25

@export var speed: int = 300
@export var is_flipped: bool = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var move_timer: Timer = $MoveTimer
@onready var wait_timer: Timer = $WaitTimer

var _direction: Vector2
var _can_move: bool = false

func _ready() -> void:
	_direction = Vector2.LEFT if randi() % 2 == 0 else Vector2.RIGHT
	animated_sprite.sprite_frames = sprite_frames
	animated_sprite.scale.x = _direction.x if not is_flipped else -_direction.x
	animated_sprite.play()
	wait_timer.start(randf_range(min_move_time, max_move_time))


func _process(delta: float) -> void:
	if _can_move:
		position += speed * delta * _direction


func _on_move_timer_timeout() -> void:
	_can_move = false
	wait_timer.start(randf_range(min_move_time, max_move_time))


func _on_wait_timer_timeout() -> void:
	_can_move = true
	_direction = _pick_direction()
	animated_sprite.scale.x = _direction.x if not is_flipped else -_direction.x
	move_timer.start(randf_range(min_move_time, max_move_time))


func _pick_direction() -> Vector2:
	if position.x < -60:
		return Vector2.RIGHT
	if position.x > 1980:
		return Vector2.LEFT
	
	return _direction * Vector2.LEFT
