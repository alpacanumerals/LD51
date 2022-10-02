extends Node

export (int) var max_time = 10
var time = 10
var pause_box = preload("res://level/PauseBox.tscn")
var current_floor = 1

signal reset_map
signal set_floor(floor_number)

# Called when the node enters the scene tree for the first time.
func _ready():
    time = max_time
    music.play_battle()
    current_floor = 1
    emit_signal("set_floor", current_floor)
    
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
    current_floor += 1
    emit_signal("set_floor", current_floor)
    emit_signal("reset_map")

func _on_PlayArea_map_clear():
    reset()
