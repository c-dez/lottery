class_name LotteryManager
extends Control


@export var sprite_image: Texture2D
@onready var grid_container_slots: GridContainer = get_node("GridContainerSlots")
@onready var create_lottery_button: Button = get_node("CreateLotteryButton")

# botones para seleccionar linea, los pongo por individual que la alternativa es controlarlos con un Node2D pero no quiero que tambien controle su posicion
@onready var select_buttons_vertical:GridContainer = get_node("SelectButtonsVertical")
@onready var select_buttons_horizontal:GridContainer = get_node("SelectButtonsHorizontal")
@onready var select_buttons_diagonal:GridContainer = get_node("SelectButtonsDiagonal")
@onready var select_buttons_diagonal2:GridContainer = get_node("SelectButtonsDiagonal2")

var number_of_selections: int = 0


func _ready() -> void:
	# generate_lottery()
	# esconder todo exepto create_lottery button
	for i in get_child_count():
		var node: Node = get_child(i)
		if node is GridContainer:
			node.visible = false

	pass

func _process(_delta: float) -> void:
	if number_of_selections == 3:
		select_buttons_vertical.visible = true
		select_buttons_horizontal.visible = true
		select_buttons_diagonal.visible = true
		select_buttons_diagonal2.visible = true
	pass


func set_buttons_data() -> void:
	var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	base_array.shuffle()

	for i in range(0, grid_container_slots.get_child_count()):
		var button: LotteryButton = LotteryButton.new()
		grid_container_slots.get_child(i).add_child(button)
		button.name = "button%d" % i
		button.sprite.name = "sprite%d" % i
		button.lottery_number = base_array[i]
		button.connect("pressed", _on_button_pressed.bind(button))

	var rng: int = randi_range(0, base_array.size() - 1)
	var b: LotteryButton = grid_container_slots.get_child(rng).get_child(0)
	b.sprite.visible = false
	b.disabled = true
	b.text = "%d" % b.lottery_number

	number_of_selections = 0
	#oculto boton crear loteria
	create_lottery_button.visible = false

	# aqui revelo gridContainerSlots
	grid_container_slots.visible = true

	pass


func _on_create_lottery_button_button_down() -> void:
	if grid_container_slots.get_child(0).get_child_count() == 0:
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
