extends HTTPRequest

onready var individuals_manager = $"../../club/individuals"

var clubbers_data

signal clubber_parsed

func _ready():
	var error = request(str(API.url, "/clubbers"))
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _on_request_completed(result, response_code, headers, body):	
	var response = JSON.parse(body.get_string_from_utf8())

	clubbers_data = response.result
	
	for clubber in clubbers_data:
		individuals_manager.add_individual(\
			int(clubber.id), 
			clubber.name, 
			clubber.money, 
			clubber.satisfaction, 
			int(clubber.bizarre_alluring), 
			int(clubber.introvert_exuberant))

func on_clubber_parsed():
	if clubbers_data.size() == 0:
		return
	
	var clubber = clubbers_data[0]
	
	individuals_manager.add_individual(\
		int(clubber.id), 
		clubber.name, 
		clubber.money, 
		clubber.satisfaction, 
		int(clubber.bizarre_alluring), 
		int(clubber.introvert_exuberant))
	
	clubbers_data.pop_front()
	
	emit_signal("clubber_parsed")
