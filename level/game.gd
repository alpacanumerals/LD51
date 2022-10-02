extends Node

export (int) var max_time = 10
var time = 10
var pause_box = preload("res://level/PauseBox.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    time = max_time
    music.play_battle()
    
func _physics_process(delta):
    time -= delta
    time = clamp(time, 0, max_time)
    if time <= 0:
        time_out()

func _input(event):
    if event is InputEventKey and event.pressed:
        if event.scancode == KEY_ESCAPE or event.scancode == KEY_P:
            add_child(pause_box.instance())
            
func time_out():
    reset()
    
func reset():
    time = max_time
    get_node("%PlayArea").reset_map()
