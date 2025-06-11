class_name LotteryManager
extends Control


@onready var grid_container: GridContainer = get_node("GridContainer")
@onready var create_lottery_button: Button = get_node("CreateLotteryButton")


func _ready() -> void:
	# generate_lottery()
	pass

	
func generate_lottery() -> void:
	var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	base_array.shuffle()
	print(base_array)
	# create buttons
	for i in range(0, base_array.size()):
		var button: LotteryButton = LotteryButton.new()
		# var image: Sprite2D = Sprite2D.new()

		button.lottery_number = base_array[i]
		button.connect("pressed", _on_button_pressed.bind(button))
		grid_container.add_child(button)
	
	# chose at random 1 button and hide his var sprite and show his lottery_number
	var button: LotteryButton = grid_container.get_child(randi_range(0, grid_container.get_child_count()))
	button.sprite.visible = false
	button.text = "%d"%button.lottery_number
	button.disabled = true


func _on_create_lottery_button_button_down() -> void:
	generate_lottery()
	
	
func _on_button_pressed(button: LotteryButton) -> void:
	# print(button.lottery_number)
	button.disabled = true
	button.sprite.visible = false
	button.text = "%d" % button.lottery_number
