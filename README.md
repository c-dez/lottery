# Lotery

## Descripcion
- Loteria de 9 numeros
- Los numeros son del 1 al 9
- mostrar en "casillas" 3x3:
    - 123
    - 456
    - 789
- el orden de los numeros es al azar
- una casilla al azar muestra el numero
- el resto de casillas ocultan su numero
- el jugador puede seleccionar 3 casillas para mostrar el numero que oculta
- al seleccionar las 3 casillas
- jugador puede elegir una entre 8 opciones
- estas 8 opciones son las lineas de tres numeros, horizontal, vertical o diagonal
- el objetivo de el jugador es elegir la linea que le de la mayor o menor suma posible para una mejor recompenza

## Log
    LotteryManager (Control)
        |-GridContainer
            |-Button1
                |-Sprite2D
            |-...Button9


- Al presionar boton create_lottery se ejecuta codigo de generar array de numeros y botones que los representen

- TODO:
    - crear 8 botones para cada linea horizontal, vertical y diagonal
    - al elegir tres casillas estos botones se muestran
    - al pasar el mouse por encima de estos botones, se resalta las casillas que este boton elige
    - al seleccionar un boton, se muestran todas las casillas y se suma los numeros de las casillas elegidas
    - dependiendo de la suma es la recompenza