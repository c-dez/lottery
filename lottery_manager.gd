class_name LotteryManager
extends Control


@export var sprite_image:Texture2D
@onready var grid_container: GridContainer = get_node("GridContainer")
@onready var create_lottery_button: Button = get_node("CreateLotteryButton")

var number_of_selections: int = 0


func _ready() -> void:
	# generate_lottery()
	pass

func _process(_delta: float) -> void:
	# print(number_of_selections)
	pass


func set_buttons_data() -> void:
	var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	base_array.shuffle()

	for i in range(0, grid_container.get_child_count()):
		var button:LotteryButton = LotteryButton.new()
		grid_container.get_child(i).add_child(button)
		button.name = "button%d" % i
		button.sprite.name = "sprite%d" % i
		button.lottery_number = base_array[i]
		button.connect("pressed", _on_button_pressed.bind(button))

	var rng: int = randi_range(0, base_array.size() - 1)
	var b:LotteryButton = grid_container.get_child(rng).get_child(0)
	b.sprite.visible = false
	b.disabled = true
	b.text = "%d" % b.lottery_number

	number_of_selections = 0
	create_lottery_button.visible = false

	pass


func _on_create_lottery_button_button_down() -> void:
	
	if grid_container.get_child(0).get_child_count() == 0:
		set_buttons_data()
	# else:
	# 	create_lottery_button.visible = false

		pass

	


func _on_button_pressed(button: LotteryButton) -> void:
	if number_of_selections < 3:
		button.disabled = true
		button.sprite.visible = false
		button.text = "%d" % button.lottery_number
		number_of_selections += 1
