extends Node

var games:Array

class SortGames:
	static func last_played(a,b):
		var a_epoch:int
		var b_epoch:int
		
		if a["lastplayed"] == null:
			a_epoch = 0
		else:
			a_epoch = Time.get_unix_time_from_datetime_string(a["lastplayed"])
		
		if b["lastplayed"] == null:
			b_epoch = 0
		else:
			b_epoch = Time.get_unix_time_from_datetime_string(b["lastplayed"])
		
		if a_epoch > b_epoch:
			return true
		return false
	
	static func most_played(a,b):
		# TODO: Support playtime with more than one day
		var a_epoch:int
		var b_epoch:int
		
		if a["playtime"] == null:
			a_epoch = 0
		else:
			a_epoch = Time.get_unix_time_from_datetime_string(a["playtime"])
		
		if b["playtime"] == null:
			b_epoch = 0
		else:
			b_epoch = Time.get_unix_time_from_datetime_string(b["playtime"])
		
		if a_epoch > b_epoch:
			return true
		return false

func run_game(game:Dictionary, lutris_which:String=""):
	var lutris:String
	var cmd:String = ""
	var output:Array
	var r:int
	
	if lutris_which!="":
		lutris = lutris_which
	else:
		r = OS.execute("which",["lutris"],true,output)
		lutris = output[0].strip_edges()
	
	if "id" in game:
		cmd = "lutris:rungameid/"+str(game["id"])
	elif "slug" in game:
		cmd = "lutris:rungame/"+game["slug"]
	
	r = OS.execute(lutris,[cmd],false)
	return r

func get_cover_path(game:Dictionary, cache_path:String=""):
	var home:String
	var lutris_cache:String
	
	if cache_path!="":
		lutris_cache = cache_path
	else:
		home = OS.get_environment("HOME")
		lutris_cache = home + "/.cache/lutris"
	
	return lutris_cache+"/coverart/"+game["slug"]+".jpg"

func get_games(lutris_which:String=""):
	var output:Array
	var lutris:String
	var r:int
	
	if lutris_which!="":
		lutris = lutris_which
	else:
		r = OS.execute("which",["lutris"],true,output)
		lutris = output[0].strip_edges()
	
	r = OS.execute(lutris,["--list-games","--installed","--json"],true,output)
	return parse_json(output[0])

func update_games():
	games = get_games()

func _ready():
	update_games()
