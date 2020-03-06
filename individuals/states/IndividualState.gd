extends Node

onready var user = $"../.."

func init(_user, state_timer):
	state_timer.wait_time = rand_range(5 * Constants.time_scale, 30 * Constants.time_scale)

func start():
	pass

func stop():
	pass

func get_probability():
	return 10
