extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_TextureButton3_pressed():
    if OS.window_fullscren == false:
        OS.set_window_fullscreen(true)
    else:
        OS.set_window_fullscreen(false)
