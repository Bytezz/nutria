tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("RelativeMargin", "MarginContainer", preload("RelativeMargin.gd"), preload("icon.png"))


func _exit_tree():
	remove_custom_type("RelativeMargin")
