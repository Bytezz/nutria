extends Control

var game : Dictionary
var drawer_row : Node

func _on_Button_pressed():
	LutrisApi.run_game(game)
