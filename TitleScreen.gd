extends Node

func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_OptionsButton_pressed():
    switcher.playClick()
    switcher.switchScene("res://Options.tscn")
    
func _on_FullScreenButton_pressed():
    switcher.playClick()
    if OS.window_fullscreen == false:
        OS.set_window_fullscreen(true)
    else:
        OS.set_window_fullscreen(false)

func _on_NewGameButton_pressed():
    switcher.playClick()
    switcher.switchScene("res://level/Game.tscn")
