extends Spatial

export (PackedScene) var individual_template

func setup(all_individuals):
	for data in all_individuals:
		add_individual(data)
	
	for child in get_children():
		child.generate_relationships(get_children())

func add_individual(data):
	var i = individual_template.instance()
	i.generate_stats()
	add_child(i)