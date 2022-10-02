extends Node

var prog = false

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    yield(get_tree().create_timer(0.20), "timeout")
    prog = true
    
func _process(delta):
    if Input.is_action_just_pressed("ui_cancel"):
        if prog:
            music.Orchestrion.set_stream_paused(false)
            yield(get_tree().create_timer(0.20), "timeout")
            get_tree().paused = false
            queue_free()

func _on_BackB_pressed():
    sounds.sfx_sel()
    yield(get_tree().create_timer(0.15), "timeout")
    get_tree().paused = false
    queue_free()

func _on_BackB_mouse_entered():
    sounds.sfx_mo()
