class_name LotteryButton
extends Button

@export var texture_image: Texture2D = preload("res://icon.svg")
var lottery_number:int = 0
var sprite:Sprite2D


func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	sprite = Sprite2D.new()
	sprite.texture = texture_image
	sprite.centered =false
	add_child(sprite)

