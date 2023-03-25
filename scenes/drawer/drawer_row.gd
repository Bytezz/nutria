extends Control

onready var IconsContainer = $VBoxContainer/ScrollContainer/IconsContainer
onready var RowTitleLabel = $VBoxContainer/RowTitleLabel
onready var TitleLabel = $VBoxContainer/TitleLabel
onready var InfoLabel = $VBoxContainer/InfoLabel

func add(node:Node):
	IconsContainer.add_child(node)
	node.drawer_row = self

func set_title(title:String):
	RowTitleLabel.text = title

func update_focused_info(node):
	if "name" in node.game:
		TitleLabel.text = node.game["name"]
	else:
		TitleLabel.text = "NoName"
	if "platform" in node.game and "playtime" in node.game:
		InfoLabel.text = "Platform: "+str(node.game["platform"])+"  Time Played: "+str(node.game["playtime"])
	else:
		InfoLabel.text = "NoInfo"
