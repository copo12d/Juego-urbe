extends Node

func suma_aleatoria():
	randomize()
	var numero1 = randi() % 100 +1 # Genera un número aleatorio entre 1 y 99
	var numero2 = randi() % 100 +1 # Genera otro número aleatorio entre 1 y 99
	var suma = numero1 + numero2
	return [numero1, numero2, suma]

func resta_aleatoria():
	randomize()
	var numero1 = randi() % 100 +1 # Genera un número aleatorio entre 1 y 99
	var numero2 = randi() % 100 +1 # Genera otro número aleatorio entre 1 y 99
	var suma = numero1 - numero2
	return [numero1, numero2, suma]

func division_aleatoria():
	randomize()
	var numero1 = randi() % 100 + 1 # Genera un número aleatorio entre 1 y 99
	var numero2 = randi() % 100 + 1 # Genera otro número aleatorio entre 1 y 99
	var suma = float(numero1) / float(numero2) # Convierte los números a flotantes
	return [numero1, numero2, suma]


func multiplicacion_aleatoria():
	randomize()
	var numero1 = randi() % 100 +1 # Genera un número aleatorio entre 1 y 99
	var numero2 = randi() % 100 +1 # Genera otro número aleatorio entre 1 y 99
	var suma = numero1 * numero2
	return [numero1, numero2, suma]


func _ready():
	print(suma_aleatoria())
	print(resta_aleatoria())
	print(multiplicacion_aleatoria())
	print(division_aleatoria())
