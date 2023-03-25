extends Label

func refresh():
	text = String(OS.get_power_percent_left())+"%"

func _ready():
	refresh()
