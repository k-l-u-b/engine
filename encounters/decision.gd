extends Node

func execute(actor, target):
	var outcome = decide(actor, target)
	return outcome

func decide(actor, target):
	var outcome
	var max_inclination = -1
	for c in get_children():
		var c_inclination = c.get_inclination(actor, target)
		if c_inclination > max_inclination:
			max_inclination = c_inclination
			outcome = c
	
	print(actor.name + " " + outcome.descriptor)
	
	return outcome
