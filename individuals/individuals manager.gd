extends Spatial

export (PackedScene) var individual_template

func _ready():
	init()

func init():
#	for child in get_children():
#		child.generate_relationships(get_children())
		
	for child in get_children():
		child.start()

func add_individual(id, name, money, bizarre_alluring, introvert_exuberant, anxious_satisfied):
	var i = individual_template.instance()
	add_child(i)
	i.init(id, name, money, bizarre_alluring, introvert_exuberant, anxious_satisfied)
	i.start()

func get_individual(id):
	for c in get_children():
		if c.id == id:
			return c

func pick_random_clubber():
	var i = randi() % get_child_count()
	return get_child(i)
