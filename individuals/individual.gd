extends Spatial

export (PackedScene) var perceived_individual_template

onready var others = $others

var satisfaction	# 0-100

var bizarre_alluring		# -100 ; 100
var introvert_exuberant		# -100 ; 100

func _ready():
	pass

func generate_stats():
	satisfaction = rand_range(0, 100)
	
	bizarre_alluring = rand_range(-100, 100)
	introvert_exuberant = rand_range(-100, 100)

func generate_relationships(individuals):
	for i in individuals:
		if i == self:
			continue
		var i_node = perceived_individual_template.instance()
		i_node.generate_stats(i)
		others.add_child(i_node)