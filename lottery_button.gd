class_name LotteryButton
extends Button


var lottery_number:int = 0
var sprite:Sprite2D

func _ready() -> void:
	# icon = preload("res://icon.svg")
	custom_minimum_size = Vector2(128, 128)
	sprite = Sprite2D.new()
	sprite.texture = preload("res://icon.svg")
	sprite.centered =false
	add_child(sprite)
