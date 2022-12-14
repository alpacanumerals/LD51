extends Node

var pause_box = preload("res://level/PauseBox.tscn")
var game_over = preload("res://level/GameOver.tscn")
var game_under = preload("res://level/Victory.tscn")

export (int) var max_time = 10
var time = 10
var timer_active = true

var current_floor = 1

signal reset_map
signal set_floor(floor_number)
signal update_health(health)
signal stop_play

# Called when the node enters the scene tree for the first time.
func _ready():
    if switcher.timer:
        max_time = 30
    time = max_time
    music.play_battle()
    current_floor = 1
    emit_signal("set_floor", current_floor)
    
func _physics_process(delta):
    if current_floor > 40:
        victory() 
    if timer_active:
        time -= delta
        time = clamp(time, 0, max_time)
        if time <= 0:
            time_out()

func _input(event):
    if event is InputEventKey and event.pressed:
        if event.scancode == KEY_ESCAPE or event.scancode == KEY_P:
            add_child(pause_box.instance())
            
func time_out():
    timer_active = false
    emit_signal("stop_play")
    end_game()

func end_game():    
    $Transit.ftb()
    
func end_game2():
    switcher.finalfloor = current_floor
    add_child(game_over.instance())
    get_node("%PlayArea").queue_free()

func reset():
    time = max_time
    timer_active = true
    current_floor += 1
    emit_signal("set_floor", current_floor)
    emit_signal("reset_map")

func _on_PlayArea_map_clear():
    reset()

func _on_PlayArea_map_failed():
    timer_active = false
    yield(get_tree().create_timer(2.0), "timeout")
    end_game()

func _on_PlayArea_update_health(health):
    emit_signal("update_health", health)

func _on_Transit_ftb_done():
    if current_floor > 40:
        victory2()
    else:
        end_game2()

func victory():
    timer_active = false
    $Transit.ftb()
    
func victory2():
    switcher.finalfloor = current_floor
    add_child(game_under.instance())
    get_node("%PlayArea").queue_free()
