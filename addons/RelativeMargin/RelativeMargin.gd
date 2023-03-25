## Coded by Bytez
## https://github.com/bytezz/godot-RelativeMargin
## ----
## MarginContainer with margin size relative to its own size.
## (for Godot Game Engine).

tool
extends MarginContainer

export(float, 0.0, 1.0, 0.001) var marginTop = 0.0 setget set_marginTop
export(int) var minTop = 0 setget set_minTop
export(int) var maxTop = INF setget set_maxTop

export(float, 0.0, 1.0, 0.001) var marginRight = 0.0 setget set_marginRight
export(int) var minRight = 0 setget set_minRight
export(int) var maxRight = INF setget set_maxRight

export(float, 0.0, 1.0, 0.001) var marginBottom = 0.0 setget set_marginBottom
export(int) var minBottom = 0 setget set_minBottom
export(int) var maxBottom = INF setget set_maxBottom

export(float, 0.0, 1.0, 0.001) var marginLeft = 0.0 setget set_marginLeft
export(int) var minLeft = 0 setget set_minLeft
export(int) var maxLeft = INF setget set_maxLeft

func _init():
	if not is_connected("resized", self, "refresh"):
		connect("resized", self, "refresh")
	refresh()


func set_marginTop(value:float):
	marginTop = value
	refresh()
func set_minTop(value:int):
	minTop = value
	refresh()
func set_maxTop(value:int):
	maxTop = value
	refresh()

func set_marginRight(value:float):
	marginRight = value
	refresh()
func set_minRight(value:int):
	minRight = value
	refresh()
func set_maxRight(value:int):
	maxRight = value
	refresh()

func set_marginBottom(value:float):
	marginBottom = value
	refresh()
func set_minBottom(value:int):
	minBottom = value
	refresh()
func set_maxBottom(value:int):
	maxBottom = value
	refresh()

func set_marginLeft(value:float):
	marginLeft = value
	refresh()
func set_minLeft(value:int):
	minLeft = value
	refresh()
func set_maxLeft(value:int):
	maxLeft = value
	refresh()


func refresh():
	if int(INF) == maxTop: maxTop = INF
	if int(INF) == maxRight: maxRight = INF
	if int(INF) == maxBottom: maxBottom = INF
	if int(INF) == maxLeft: maxLeft = INF
	
	var pxMarginTop = clamp(rect_size.y*marginTop, minTop, maxTop)
	var pxMarginRight = clamp(rect_size.x*marginRight, minRight, maxRight)
	var pxMarginBottom = clamp(rect_size.y*marginBottom, minBottom, maxBottom)
	var pxMarginLeft = clamp(rect_size.x*marginLeft, minLeft, maxLeft)
	
	add_constant_override("margin_top", pxMarginTop)
	add_constant_override("margin_right", pxMarginRight)
	add_constant_override("margin_bottom", pxMarginBottom)
	add_constant_override("margin_left", pxMarginLeft)
