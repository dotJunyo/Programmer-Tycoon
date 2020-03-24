extends HTTPRequest

signal connection_success

var check_timer = null
var wifi

func _ready():
	check_timer = Timer.new()
	check_timer.autostart = true
	check_timer.one_shot = false
	check_timer.wait_time = 3
	check_timer.connect("timeout", self, "_check_connection")
	add_child(check_timer)
	connect("request_completed", self, "on_request_result")

func stop_check():
	if not check_timer.is_stopped():
		check_timer.stop()

func start_check():
	if check_timer.is_stopped():
		check_timer.start()

func _check_connection():
	request("http://www.google.com")

func on_request_result(result, response_code, headers, body):
	match result:
		RESULT_SUCCESS:
			emit_signal("connection_success")
			wifi = true
