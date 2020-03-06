extends Node

var target
var p_bizarre_alluring setget , get_p_bizarre_alluring
var p_introvert_exuberant setget , get_p_introvert_exuberant

func generate_stats(ref):
	target = ref
	p_bizarre_alluring = int(target.bizarre_alluring + rand_range(-20, 20))
	p_introvert_exuberant = int(target.introvert_exuberant + rand_range(-0.2, 0.2))

func get_p_bizarre_alluring():
	print(target)
	return p_bizarre_alluring + target.p_bonus_bizarre_alluring

func get_p_introvert_exuberant():
	return p_introvert_exuberant + target.p_bonus_introvert_exuberant
