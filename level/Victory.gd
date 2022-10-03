extends Node

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    music.Orchestrion.stop()    
    yield(get_tree().create_timer(0.25), "timeout")
    music.play_victory()

func _on_MainMenu_pressed():
    sounds.sfx_sel()
    music.Orchestrion.stop()
    yield(get_tree().create_timer(0.05), "timeout")
    switcher.switch_scene("res://Title.tscn")

func _on_MainMenu_mouse_entered():
    sounds.sfx_mo()
