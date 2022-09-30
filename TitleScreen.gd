extends Node

func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_TextureButton3_pressed():
    if OS.window_fullscreen == false:
        OS.set_window_fullscreen(true)
    else:
        OS.set_window_fullscreen(false)
