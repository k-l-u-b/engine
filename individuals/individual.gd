extends Spatial

export (PackedScene) var perceived_individual_template

onready var others = $others
onready var state_timer = $"state timer"
onready var life = $life

var id						
var money					
var bizarre_alluring		# -100 ; 100
var introvert_exuberant		# -100 ; 100
var anxious_satisfied		# -100 ; 100

var current_decision
var current_outcome

var target

func start():
	state_timer.wait_time = rand_range(2, 5)
	state_timer.start()
	target = null
	start_activity()

func init(id, name, money, bizarre_alluring, introvert_exuberant, anxious_satisfied):
	self.id = int(id)
	self.name = name
	self.money = money
	self.bizarre_alluring = bizarre_alluring
	self.introvert_exuberant = introvert_exuberant
	self.anxious_satisfied = anxious_satisfied
	
	$"get perceptions".init()
	current_decision = $"../../encounter tree/start"

func generate_relationships(individuals):
	for i in individuals:
		generate_relationship(i)

func generate_relationship(target):
	var i_node = perceived_individual_template.instance()
	i_node.generate_stats(target)
	others.add_child(i_node)
	return i_node

func add_relationship(target_id, p_bizarre_alluring, p_introvert_exuberant):
	var i_node = find_relationship_with(target_id)
	
	if i_node:
		i_node.update(p_bizarre_alluring, p_introvert_exuberant)
	else:
		i_node = perceived_individual_template.instance()
		i_node.init(target_id, p_bizarre_alluring, p_introvert_exuberant)
		others.add_child(i_node)

func update_relationship(relationship_node, p_bizarre_alluring, p_introvert_exuberant):
	relationship_node.update(p_bizarre_alluring, p_introvert_exuberant)

func find_relationship_with(target_id):
	for c in others.get_children():
		if c.target_id == target_id:
			return c

func start_activity():
	current_outcome = current_decision.execute(self, target)
	
	state_timer.wait_time = rand_range(5, 100)
	state_timer.start()

# returns a relationship
func pick_target_known():
	if others.get_child_count() == 0:
		return null
	else:
		var i = randi() % others.get_child_count()
		return others.get_child(i)

# returns a relationship
func pick_target_random():
	var target = $"..".pick_random_clubber()
	var relationship = find_relationship_with(target.id)
	if not relationship:
		relationship = generate_relationship(target)
	return relationship

func discuss():
	pass

func dance():
	pass

func drink():
	# spend money
	# temporary exuberance bonus (or bonus to everyone's perceived exuberance of the user)
	pass

func toilets():
	pass

func _on_state_timer_timeout():
	if current_outcome == null:
		current_outcome = $"../../encounter tree/start"
#	elif current_outcome == $"../../encounter tree/start":
#		start_activity()
	
	var pick_target = current_outcome.end(self, target)
	
	current_decision = current_outcome.get_next_encounter()
	current_outcome = null

	if pick_target == "random":
		target = pick_target_random()
	elif pick_target == "known":
		target = pick_target_known()
	
	start_activity()
