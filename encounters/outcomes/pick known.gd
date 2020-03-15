# outcome: 
# pick someone known

extends "outcome.gd"

export var action = "pick known"
export var descriptor = "is looking for someone they know"


func resolve(actor, target):
	.resolve(actor, target)
