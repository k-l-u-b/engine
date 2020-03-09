extends "IndividualState.gd"


func start():
	var drink = Constants.random_drink()
#	print("user ", user.name, " is drinking ", drink)
	
	user.self_perception.p_introvert_exuberant += 10
	
#	user.satisfaction += 100 / user.self_perception.p_introvert_exuberant
	user.satisfaction += randi() % 10 - 3
	
#func get_probability():
#	pass
