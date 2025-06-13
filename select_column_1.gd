extends Button

# prototipo, expandir a una clase para poder ser instanciado 8 veces y  que se encargue de decidir que linea se elige 



# necesito saber el valor de lottery_number de gridContainerSlots 0,3,6

var lottery_manager: LotteryManager
var values: Array = [0, 0, 0]
var sum_of_values: int = 0

# signal para revelar todos los numeros, LotteryManager la escucha
signal selection_was_made()


func _ready() -> void:
	lottery_manager = get_parent().get_parent().get_parent() # esta muy fea esta referencia: revisar get_tree()
	lottery_manager.connect("number_of_selections_is_3", _on_number_of_selections_is_3)
	custom_minimum_size = Vector2(128, 128)# hardcode referenciar el tamano de imagen


func _on_number_of_selections_is_3() -> void:
	# escucha signal desde LotteryManager
	
	values = [lottery_manager.base_array[0],lottery_manager.base_array[3],lottery_manager.base_array[6]]

	sum_of_values = values.reduce(func(a, b): return a + b)
	print(lottery_manager.base_array)


func _on_pressed() -> void:
	# muestra el valor en el texto de boton
	text ="%d" % sum_of_values
	emit_signal("selection_was_made")
	disabled = true
