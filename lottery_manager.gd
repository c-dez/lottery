class_name LotteryManager
extends Control

var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

@export var sprite_image: Texture2D
@onready var grid_container_slots: GridContainer = get_node("GridContainerSlots")
@onready var create_lottery_button: Button = get_node("CreateLotteryButton")

# botones para seleccionar linea, los pongo por individual que la alternativa es controlarlos con un Node2D pero no quiero que tambien controle su posicion
@onready var select_buttons_vertical: GridContainer = get_node("SelectButtonsVertical")
@onready var select_buttons_horizontal: GridContainer = get_node("SelectButtonsHorizontal")
@onready var select_buttons_diagonal: GridContainer = get_node("SelectButtonsDiagonal")
@onready var select_buttons_diagonal2: GridContainer = get_node("SelectButtonsDiagonal2")

var number_of_selections: int = 0

# custom signal
signal number_of_selections_is_3()

var select_button


func _ready() -> void:
	# esconder todo exepto create_lottery button
	for i in get_child_count():
		var node: Node = get_child(i)
		if node is GridContainer:
			node.visible = false

	# signal para revelar todos los numeros
	select_button = get_node("SelectButtonsHorizontal/ItemList0/SelectColumn1")
	select_button.connect("selection_was_made", _on_selection_was_made)

func _process(_delta: float) -> void:
	# al elegir 3 casillas se muestran los botones de elegir linea
	if number_of_selections == 3:
		# cambiar la logica de number_of_selections a -=1 cuando se llega a 0 se ejecuta este bloque y cuando es -1  se permite elegir lineas
		select_buttons_vertical.visible = true
		select_buttons_horizontal.visible = true
		select_buttons_diagonal.visible = true
		select_buttons_diagonal2.visible = true

		emit_signal("number_of_selections_is_3")
		number_of_selections += 1


func create_lottery_buttons() -> void:
	# var base_array: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
	# termina la capacidad de seleccionar casillas
	number_of_selections = 0
	#oculto boton crear loteria
	create_lottery_button.visible = false
	# revelo gridContainerSlots
	grid_container_slots.visible = true


func _on_create_lottery_button_button_down() -> void:
	if grid_container_slots.get_child(0).get_child_count() == 0:
		create_lottery_buttons()

	
func _on_button_pressed(button: LotteryButton) -> void:
	if number_of_selections < 3:
		button.disabled = true
		button.sprite.visible = false
		button.text = "%d" % button.lottery_number
		number_of_selections += 1


func _on_selection_was_made() -> void:
	# escucha la signal desde select_column_1.gd
	for i in range(0, grid_container_slots.get_child_count()):
		# oculta los sprites
		grid_container_slots.get_child(i).get_child(0).sprite.visible = false
		# agrega el texto segun su lottery value
		grid_container_slots.get_child(i).get_child(0).text = "%d" % grid_container_slots.get_child(i).get_child(0).lottery_number
		# desactiva su boton
		grid_container_slots.get_child(i).get_child(0).disabled = true
