extends Control

func _ready():
	$SafeArea/RelativeMargin/VBoxContainer/HBoxContainer/DoneBtn.grab_focus()

func _on_DoneBtn_pressed():
	get_tree().get_nodes_in_group("IconLaunchers")[0].grab_focus()
	queue_free()
