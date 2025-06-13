class_name LotteryButton
extends Button

# preload for testing
@export var texture_image: Texture2D = preload("res://icon.svg")
var lottery_number:int = 0
var sprite:Sprite2D


func _ready() -> void:
	#  todos los tamanos(itemList,button etc) son iguales al tamano de icon.svg, deberia referenciar ese dato para no tener hardcode
	custom_minimum_size = Vector2(128, 128)
	sprite = Sprite2D.new()
	sprite.texture = texture_image
	sprite.centered =false
	add_child(sprite)

