extends Node

var target setget , get_target
var target_id
var p_bizarre_alluring
var p_introvert_exuberant
var p_anxious_satisfied

func init(target_id, p_bizarre_alluring, p_introvert_exuberant):
	self.name = String(target_id)
	self.target_id = target_id
	self.p_bizarre_alluring = p_bizarre_alluring
	self.p_introvert_exuberant = p_introvert_exuberant

func update(_p_bizarre_alluring, _p_introvert_exuberant):
	self.p_bizarre_alluring = _p_bizarre_alluring
	self.p_introvert_exuberant = _p_introvert_exuberant

func generate_stats(ref):
	target = ref
	target_id = ref.id
	p_bizarre_alluring = int(target.bizarre_alluring + rand_range(-20, 20))
	p_introvert_exuberant = int(target.introvert_exuberant + rand_range(-20, 20))
	p_anxious_satisfied = int(target.anxious_satisfied + rand_range(-20, 20))

func get_target():
	if target:
		return target
	
	target = $"../../..".get_individual(target_id)
