extends "IndividualState.gd"

var sexy_bonus = 20

func start():
	print("user ", user.name, " is dancing")
	user.p_bonus_bizarre_alluring += sexy_bonus

func stop():
	user.p_bonus_bizarre_alluring -= sexy_bonus

func get_probability():
	return user.introvert_exuberant + \
		user.self_perception.p_introvert_exuberant
#		+ user.self_perception.p_bizarre_alluring
