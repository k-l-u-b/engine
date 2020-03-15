extends Node

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
