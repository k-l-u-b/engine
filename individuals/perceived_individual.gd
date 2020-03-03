extends Node

var p_bizarre_alluring
var p_introvert_exuberant

func generate_stats(ref):
	p_bizarre_alluring = ref.bizarre_alluring + rand_range(-0.2, 0.2)
	p_introvert_exuberant = ref.introvert_exuberant + rand_range(-0.2, 0.2)