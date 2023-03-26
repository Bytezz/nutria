extends Button

var settings_ui = preload("res://scenes/settings/settings.tscn")

func _ready():
	text = OS.get_environment("USER")

func _on_UserButton_pressed():
	get_tree().get_root().add_child(settings_ui.instance())
