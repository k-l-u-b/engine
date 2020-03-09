extends HTTPRequest

onready var clubber = $".."

func init():
	var error = request(API.url + "/clubber/" + String(clubber.id) + "/perceptions")
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _on_request_completed(result, response_code, headers, body):
	var response = JSON.parse(body.get_string_from_utf8())
	
	for perception in response.result:
		clubber.add_relationship(\
#			perception.id,
			int(perception.target_clubber_id), 
			int(perception.bizarre_alluring), 
			int(perception.introvert_exuberant))
