extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true    
    
func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_RIGHT and event.pressed:
            get_tree().paused = false
            queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
