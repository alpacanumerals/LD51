extends Node

func _ready():
    randomize()
    if not music.Orchestrion.is_playing():
        yield(get_tree().create_timer(0.5), "timeout")
        music.play_title()

func _on_OptionsButton_pressed():
    sounds.sfx_sel()
    switcher.switch_scene("res://Options.tscn")
    
func _on_FullScreenButton_pressed():
    sounds.sfx_sel()
    yield(get_tree().create_timer(0.15), "timeout")
    if OS.window_fullscreen == false:
        OS.set_window_fullscreen(true)
    else:
        OS.set_window_fullscreen(false)

func _on_NewGameButton_pressed():
    sounds.sfx_sel()
    music.Orchestrion.stop()
    switcher.switch_scene_long("res://level/Game.tscn")

func _on_NewGameButton_mouse_entered():
    sounds.sfx_mo()

func _on_OptionsButton_mouse_entered():
    sounds.sfx_mo()

func _on_FullScreenButton_mouse_entered():
    sounds.sfx_mo()
