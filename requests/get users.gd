extends HTTPRequest

onready var individuals_manager = $"../../club/individuals"

var clubbers_data

signal clubber_parsed

func _ready():
	do_request()

func do_request():
	var request_url = str(API.url, "/clubbers")
	var error = request(request_url)
	if error != OK:
		push_error("An error occurred in the HTTP request: error " + error)

func _on_request_completed(result, response_code, headers, body):
	var response = JSON.parse(body.get_string_from_utf8())
	clubbers_data = response.result
	
	for clubber in clubbers_data:
		individuals_manager.add_individual(\
			int(clubber.id), 
			clubber.name, 
			clubber.money, 
			int(clubber.bizarre_alluring), 
			int(clubber.introvert_exuberant),
			int(clubber.anxious_satisfied))
		
		yield(get_tree().create_timer(1.0), "timeout")

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
