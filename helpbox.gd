extends Node

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    yield(get_tree().create_timer(0.20), "timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _input(event):
    if event is InputEventKey and event.pressed:
        if event.scancode == KEY_ESCAPE:
            yield(get_tree().create_timer(0.15), "timeout")
            get_tree().paused = false
            queue_free()

func _on_BackB_pressed():
    sounds.sfx_sel()
    yield(get_tree().create_timer(0.15), "timeout")
    get_tree().paused = false
    queue_free()

func _on_BackB_mouse_entered():
    sounds.sfx_mo()
