extends Node

#
#	Generic encounter object
#	

export (String, \
	"introvert_exuberant", 
	"p_introvert_exuberant",
	"bizarre_alluring",
	"p_bizarre_alluring",
	"anxious_satisfied",
	"p_anxious_satisfied") var trait_1
export (bool) var trait_1_positive = true
export (String, \
	"introvert_exuberant", 
	"p_introvert_exuberant",
	"bizarre_alluring",
	"p_bizarre_alluring",
	"anxious_satisfied",
	"p_anxious_satisfied") var trait_2
export (bool) var trait_2_positive = true
export(float, -1, 1, 0.01) var weighting

export (String) var pick_target

func get_inclination(actor, target):
	return bounded_sum(actor, target)

func bounded_sum(actor, target):
	return blend(\
		get_clubber_property(actor, target, trait_1, trait_1_positive),
		get_clubber_property(actor, target, trait_2, trait_2_positive),
		weighting)

func blend(x1, x2, w):
	if w <= -1.00:
		w = -1.00
	elif w >= 1.00:
		w = 1.00
	
#   this is a conversion from BNumber to UNumber
	var u = (1.0 + w) / 2.0
	return (x2*u + x1 * (1.0 - u))

func get_clubber_property(actor, target, property, positive):
	var multiplier
	if positive:
		multiplier = 1.0
	else:
		multiplier = -1.0
	
	var clubber
	if property.begins_with("p_"):
		clubber = target
	else:
		clubber = actor
	
	return 0.01 * multiplier * clubber.get(property)

func resolve(actor, target):
	match pick_target:
		"random": actor.target = actor.pick_target_random()
		"known": actor.target = actor.pick_target_known()
	
	var success = get_node("success")
	var failure = get_node("failure")
	if actor.target != null and success != null:
		return true
	elif actor.target == null and failure != null:
		return false
	
	return true

func end(actor, target):
	if resolve(actor, target):
		$success.apply_effects(actor, target)
		return true
	else:
		$failure.apply_effects(actor, target)
		return false

func get_next_encounter(success = true):
	var follow_up
	
	if success:
		follow_up = $success.get_node($success.next_node)
	else:
		follow_up = $failure.get_node($failure.next_node)
	
	return follow_up
