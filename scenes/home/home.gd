extends Control

var old_focused = null

func _ready():
	$Black.show()
	Fader.fade_out($Black)
	
	get_tree().get_nodes_in_group("IconLaunchers")[0].grab_focus()

func _notification(what):
	match what:
		# Avoid activating UI with gamepad while window not in focus
		MainLoop.NOTIFICATION_WM_FOCUS_OUT:
			var tmp = get_focus_owner()
			if not tmp == null:
				old_focused = tmp
				print(old_focused)
				old_focused.release_focus()
		MainLoop.NOTIFICATION_WM_FOCUS_IN:
			if not old_focused == null:
				old_focused.grab_focus()
				old_focused = null
