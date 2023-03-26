extends Control

func _ready():
	$SafeArea/CenterContainer/VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	get_tree().get_nodes_in_group("IconLaunchers")[0].grab_focus()
	queue_free()
