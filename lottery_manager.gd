class_name LotteryManager
extends Control


@onready var grid_container: GridContainer = get_node("GridContainer")
@onready var create_lottery_button: Button = get_node("CreateLotteryButton")

var number_of_selections: int = 0


func _ready() -> void:
	# generate_lottery()
	pass

func _process(_delta: float) -> void:
	# print(number_of_selections)
	pass


func generate_lottery() -> void:
	var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	base_array.shuffle()

	# create buttons
	for i in range(0, base_array.size()):
		var b: LotteryButton = LotteryButton.new()
		b.name = "button%d" % i
		b.lottery_number = base_array[i]# assign number from base_array
		b.connect("pressed", _on_button_pressed.bind(b))
		grid_container.add_child(b)
		b.sprite.name = "sprite%d" % i
	
	# chose at random 1 button and hide his var sprite and show his lottery_number
	var rng: int = randi_range(0, base_array.size() - 1)
	var button: LotteryButton = grid_container.get_child(rng)
	button.sprite.visible = false
	button.disabled = true
	button.text = "%d" % button.lottery_number
	
	number_of_selections = 0 # reinicia numbre_of_selections


func _on_create_lottery_button_button_down() -> void:
	if grid_container.get_child_count() == 0:
		generate_lottery()
	else:
		for child in grid_container.get_children():
			child.queue_free()


func _on_button_pressed(button: LotteryButton) -> void:
	if number_of_selections < 3:
		button.disabled = true
		button.sprite.visible = false
		button.text = "%d" % button.lottery_number
		number_of_selections += 1
