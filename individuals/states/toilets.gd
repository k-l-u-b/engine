extends "IndividualState.gd"

func start():
	print("user ", user.name, " is gone to the toilets")
	
	user.self_perception.p_introvert_exuberant -= 20

func get_probability():
	return user.self_perception.p_introvert_exuberant - 30
