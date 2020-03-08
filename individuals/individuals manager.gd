extends Spatial

export (PackedScene) var individual_template

func _ready():
	init()

func init():
#	for child in get_children():
#		child.generate_relationships(get_children())
		
	for child in get_children():
		child.start()

func add_individual(id, name, money, satisfaction, bizarre_alluring, introvert_exuberant):
	var i = individual_template.instance()
	i.init(id, name, money, satisfaction, bizarre_alluring, introvert_exuberant)
	add_child(i)

func get_individual(id):
	for c in get_children():
		if c.id == id:
			return c
