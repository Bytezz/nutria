extends Control

func _ready():
	$Black.show()
	Fader.fade_out($Black)
	
	get_tree().get_nodes_in_group("IconLaunchers")[0].grab_focus()
