extends Node

var current_scene

var click_sound = preload("res://sfx/ui_click.tscn")
var ui_click

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    #An autoloaded node is the elder sibling of whatever scene is active, so they share a root.
    var root = get_tree().get_root()
    #A count of the children is always 1 more than the 0-indexed id of the active scene.
    #(The one with everythnig in it)
    current_scene = root.get_child(root.get_child_count() - 1)
    ui_click = click_sound.instance()
    add_child(ui_click)

#Activates with a button press somewhere.
func switchScene(path):
    yield(get_tree().create_timer(0.15), "timeout")
    get_tree().change_scene(path)
    
func switchQuit():
    yield(get_tree().create_timer(0.2), "timeout")
    get_tree().quit()
    
func playClick():
    ui_click.play()
    pass
