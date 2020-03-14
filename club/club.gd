extends Spatial

var money
var drinks = ["beer", "moscow mule"]

func random_drink():
	return drinks[randi() % drinks.size()]
