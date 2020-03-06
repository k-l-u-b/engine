extends HTTPRequest

func _ready():
	var error = request("https://httpbin.org/get/users")
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _on_request_completed(result, response_code, headers, body):	
	var response = JSON.parse(body.get_string_from_utf8())
#	print(response.result)
