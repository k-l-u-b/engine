extends Spatial

export (PackedScene) var individual_template

func _ready():
	setup()

func setup():
#	for data in all_individuals:
#		add_individual(data)
	
	for i in get_children():
		i.generate_stats()
	
	for child in get_children():
		child.generate_relationships(get_children())
		
	for child in get_children():
		child.start()

func add_individual(id, name, money, satisfaction, bizarre_alluring, introvert_alluring):
	var i = individual_template.instance()
	i.generate_stats()
	add_child(i)

func update_perceptions():
	pass
