extends Spatial

export (PackedScene) var perceived_individual_template

onready var others = $others
onready var states = $states
onready var state_timer = $"state timer"

var id						
var satisfaction			# 0-100
var money					
var bizarre_alluring		# -100 ; 100
var introvert_exuberant		# -100 ; 100

var p_bonus_bizarre_alluring	# -100 ; 100
var p_bonus_introvert_exuberant	# -100 ; 100

var state

var self_perception

func start():
	p_bonus_bizarre_alluring = 0
	p_bonus_introvert_exuberant = 0
	pick_activity()

func init(id, name, money, satisfaction, bizarre_alluring, introvert_exuberant):
	self.id = int(id)
	self.name = name
	self.money = money
	self.satisfaction = satisfaction
	self.bizarre_alluring = bizarre_alluring
	self.introvert_exuberant = introvert_exuberant

func generate_stats():
	satisfaction = int(rand_range(0, 100))
	
	bizarre_alluring = int(rand_range(-100, 100))
	introvert_exuberant = int(rand_range(-100, 100))

func generate_relationships(individuals):
	for i in individuals:
		var i_node = perceived_individual_template.instance()
		if i == self:
			self_perception = i_node
		i_node.generate_stats(i)
		others.add_child(i_node)

func add_relationship(target_id, p_bizarre_alluring, p_introvert_exuberant):
	var i_node = null
	
	for c in others.get_children():
		if c.target_id == target_id:
			i_node = c
	
	if i_node:
		i_node.update(p_bizarre_alluring, p_introvert_exuberant)
	else:
		i_node = perceived_individual_template.instance()
		i_node.init(target_id, p_bizarre_alluring, p_introvert_exuberant)
		print(name)
		others.add_child(i_node)
	
	if target_id == self.id:
		self_perception = i_node
	

func update_relationship(relationship_node, p_bizarre_alluring, p_introvert_exuberant):
	relationship_node.update(p_bizarre_alluring, p_introvert_exuberant)

func pick_activity():
	return
	var activities = []
	var probabilities = []
	
	var sum = 0
	for s in states.get_children():
		var prob = s.get_probability()
		if prob <= 0:
			continue
		activities.append(s)
		probabilities.append(prob)
		sum += int(prob)
	
	print(name, " is deciding what to do...")
	print("probability repartition : ", probabilities)
	
	if state:
		state.stop()
	
	var rand = randi() % sum
	var i = 0
	for val in probabilities:
		if rand < val:
			state = activities[i]
		else:
			rand -= val
			i += 1
	
#	state = states.get_child(randi() % states.get_children().size())
	state.init(self, state_timer)
#	print(name, " started ", state.name)
	state.start()
	
	state_timer.start()

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
	pick_activity()
