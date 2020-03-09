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

# Effect of the choice on the actor and their perception
export var effect_on_actor = {
	"introvert_exuberant": 0.0,
	"p_introvert_exuberant": 0.0,
	"bizarre_alluring": 0.0,
	"p_bizarre_alluring": 0.0,
	"anxious_satisfied": 0.0,
	"p_anxious_satisfied": 0.0
}

# Effect of the choice on the target and their perception
export var effect_on_target = {
	"introvert_exuberant": 0.0,
	"p_introvert_exuberant": 0.0,
	"bizarre_alluring": 0.0,
	"p_bizarre_alluring": 0.0,
	"anxious_satisfied": 0.0,
	"p_anxious_satisfied": 0.0
}

export (NodePath) var next_node


#func start():
#	outcome.apply_effects()

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

func apply_effects(actor, target):
	actor.bizarre_alluring = effect_on_actor["bizarre_alluring"]
	actor.introvert_exuberant = effect_on_actor["introvert_exuberant"]
	actor.anxious_satisfied = effect_on_actor["anxious_satisfied"]
	
	if target:
		target.p_bizarre_alluring = effect_on_actor["p_bizarre_alluring"]
		target.p_introvert_exuberant = effect_on_actor["p_introvert_exuberant"]
		target.p_anxious_satisfied = effect_on_actor["p_anxious_satisfied"]
		
		target.target.bizarre_alluring = effect_on_target["bizarre_alluring"]
		target.target.introvert_exuberant = effect_on_target["introvert_exuberant"]
		target.target.anxious_satisfied = effect_on_target["anxious_satisfied"]
		target.target.add_relationship(\
			actor.id, 
			effect_on_target["p_bizarre_alluring"], 
			effect_on_target["p_introvert_exuberant"], 
			effect_on_target["p_anxious_satisfied"])

func end(actor, target):
	apply_effects(actor, target)

func get_next_encounter():
	var follow_up = get_node(next_node)
	return follow_up
