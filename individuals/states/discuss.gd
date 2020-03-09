extends "IndividualState.gd"

onready var others = $"../../others"

func start():
	var target
	
	for o in others.get_children():
		if o.target == user:
			continue
		if o.p_bizarre_alluring >= 60:
			target = o.target
			
	if target == null:
		target = others.get_child(randi() % others.get_child_count()).target
	
#	print("user ", user.name, " likes the looks of ", target.name, " and is talking to them")

func get_probability():
	var p = user.introvert_exuberant + user.self_perception.p_bizarre_alluring
	return p
