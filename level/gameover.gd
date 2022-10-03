extends Node

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    music.Orchestrion.stop()    
    yield(get_tree().create_timer(0.25), "timeout")
    music.play_gameover()
    
func _on_Main_Menu_mouse_entered():
    sounds.sfx_mo()

func _on_Main_Menu_pressed():
    sounds.sfx_sel()
    music.Orchestrion.stop()
    yield(get_tree().create_timer(0.05), "timeout")
    switcher.switch_scene("res://Title.tscn")
