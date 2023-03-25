extends Control

onready var lutris = get_node("/root/LutrisApi")

onready var drawer_row = preload("drawer_row.tscn")
onready var drawer_icon = preload("drawer_icon.tscn")

onready var scrollContainer = $ScrollContainer
onready var rowsContainer = $ScrollContainer/RowsContainer

func check_current_focus(node:Node):
	if node.drawer_row != null:
		scrollContainer.ensure_control_visible(node.drawer_row)

func _ready():
	var rows:Array
	var icon:Node
	var img:ImageTexture
	var dir:Directory = Directory.new()
	
	rows.append(drawer_row.instance())
	rowsContainer.add_child(rows[rows.size()-1])
	rows[rows.size()-1].set_title("Last Played")
	
	lutris.games.sort_custom(lutris.SortGames, "last_played")
	
	for game in lutris.games:
		if dir.file_exists(lutris.get_cover_path(game)):
			img = ImageTexture.new()
			img.load(lutris.get_cover_path(game))
			icon = drawer_icon.instance()
			icon.game = game
			icon.get_node("Button").icon = img
			rows[rows.size()-1].add(icon)
			icon.get_node("Button").connect("focus_entered", rows[rows.size()-1], "update_focused_info", [icon])
	
	
	rows.append(drawer_row.instance())
	rowsContainer.add_child(rows[rows.size()-1])
	rows[rows.size()-1].set_title("Most Played")
	
	lutris.games.sort_custom(lutris.SortGames, "most_played")
	
	for game in lutris.games:
		if dir.file_exists(lutris.get_cover_path(game)):
			img = ImageTexture.new()
			img.load(lutris.get_cover_path(game))
			icon = drawer_icon.instance()
			icon.game = game
			icon.get_node("Button").icon = img
			rows[rows.size()-1].add(icon)
			icon.get_node("Button").connect("focus_entered", rows[rows.size()-1], "update_focused_info", [icon])
			icon.get_node("Button").connect("focus_entered", self, "check_current_focus", [icon])
