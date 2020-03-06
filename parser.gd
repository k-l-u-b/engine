extends Node

export (String, MULTILINE) var test_json

onready var individual_manager = $"../club/individuals"

#func _ready():
#	var p = JSON.parse(test_json)
#
#	for user in p.result:
#		individual_manager.add_individual(
#			user.id, \
#			user.name, 
#			user.money, 
#			user.satisfaction, 
#			user.bizarre_alluring,
#			user.introvert_exuberant)
