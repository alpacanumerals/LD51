extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    yield(get_tree().create_timer(0.20), "timeout")
    music.Orchestrion.set_stream_paused(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_Unpause_mouse_entered():
    sounds.sfx_mo()

func _on_Full_Screen_mouse_entered():
    sounds.sfx_mo()

func _on_Main_Menu_mouse_entered():
    sounds.sfx_mo()

func _on_Unpause_pressed():
    sounds.sfx_sel()
    music.Orchestrion.set_stream_paused(false)
    yield(get_tree().create_timer(0.20), "timeout")
    get_tree().paused = false
    queue_free()

func _on_Full_Screen_pressed():
    sounds.sfx_sel()
    yield(get_tree().create_timer(0.15), "timeout")
    if OS.window_fullscreen == false:
        OS.set_window_fullscreen(true)
    else:
        OS.set_window_fullscreen(false)

func _on_Main_Menu_pressed():
    sounds.sfx_sel()
    music.Orchestrion.stop()
    switcher.switch_scene("res://Title.tscn")
    queue_free()
