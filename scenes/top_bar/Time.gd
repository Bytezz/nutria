extends Label

export var showSeconds : bool = false
var timer = Timer.new()

func refresh():
	var curtime = Time.get_time_dict_from_system()
	
	text = String(curtime["hour"])+":"+String(curtime["minute"])
	if showSeconds:
		text+=":"+String(curtime["second"])
	
	# TODO: get milliseconds
	if showSeconds:
		timer.start(1)
	else:
		timer.start(60-curtime["second"])

func _ready():
	add_child(timer)
	timer.one_shot = true
	timer.connect("timeout",self,"refresh")
	refresh()
