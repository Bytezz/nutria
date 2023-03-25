extends Control

var game : Dictionary
var drawer_row : Node

func _on_Button_pressed():
	# FIXME: Activate ui_accept with gamepad execute multiple times
	LutrisApi.run_game(game)
