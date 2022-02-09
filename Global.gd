extends Node

var VP = Vector2.ZERO


var score = 0
var time = 100
var lives = 5


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _resize():
	VP = get_viewport().size
	
func reset():
	get_tree().paused = false
	score = 0
	time = 100
	lives = 5


func update_score(s):
	score += s
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()
		
func update_time(t):
	time += t
	if time <= 0:
		var scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_time()
	
func update_lives(l):
	lives += l
	if lives <= 0:
		var scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_lives()
