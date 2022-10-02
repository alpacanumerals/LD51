extends Node

var current_scene

var mouseover_sound = preload("res://sounds/sfx/Mouseover.tscn")
var select_sound = preload("res://sounds/sfx/Select.tscn")

var shoot_a = preload("res://sounds/sfx_game/shoot_a.tscn")

var ui_mouseover
var ui_select

var sfx_shoot_a

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    #An autoloaded node is the elder sibling of whatever scene is active, so they share a root.
    var root = get_tree().get_root()
    #A count of the children is always 1 more than the 0-indexed id of the active scene.
    #(The one with everythnig in it)
    current_scene = root.get_child(root.get_child_count() - 1)
    ui_mouseover = mouseover_sound.instance()
    ui_select = select_sound.instance()
    sfx_shoot_a = shoot_a.instance()
    add_child(ui_mouseover)
    add_child(ui_select)
    add_child(sfx_shoot_a)
    

func sfx_mo():
    ui_mouseover.play()
    
func sfx_sel():
    ui_select.play()

func sfx_shoot_a():
    sfx_shoot_a.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
