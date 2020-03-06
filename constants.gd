extends Node

var time_scale = 0.01	# low => faster
var drinks = ["beer", "moscow mule"]

func random_drink():
	return drinks[randi() % drinks.size()]
