# outcome: 
# drink

extends "outcome.gd"

export var action = "drink"
export var descriptor = "is drinking"


func resolve(actor, target):
	.resolve(actor, target)
