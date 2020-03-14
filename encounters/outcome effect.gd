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
