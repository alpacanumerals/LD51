extends Node

var current_scene

var mouseover_sound = preload("res://sounds/sfx/Mouseover.tscn")
var select_sound = preload("res://sounds/sfx/Select.tscn")

var load_shoot_a = preload("res://sounds/sfx_game/shoot_a.tscn")
var load_shoot_mob_d = preload("res://sounds/sfx_game/mob_d_shoot.tscn")
var load_hit_mob = preload("res://sounds/sfx_game/mob_hit.tscn")
var load_hit_player = preload("res://sounds/sfx_game/playerhit.tscn")
var load_death_mob = preload("res://sounds/sfx_game/mob_death.tscn")
var load_death_player = preload("res://sounds/sfx_game/player_death.tscn")
var load_pickup_coin = preload("res://sounds/sfx_game/pickup_coin.tscn")
var load_pickup_pu = preload("res://sounds/sfx_game/pupu.tscn")
var load_pickup_pu2 = preload("res://sounds/sfx_game/pupu2.tscn")

var ui_mouseover
var ui_select

var game_shoot_a
var game_shoot_mob_d
var game_hit_mob
var game_hit_player
var game_death_mob
var game_death_player
var game_pickup_coin
var game_pickup_pu
var game_pickup_pu2


func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    #An autoloaded node is the elder sibling of whatever scene is active, so they share a root.
    var root = get_tree().get_root()
    #A count of the children is always 1 more than the 0-indexed id of the active scene.
    #(The one with everythnig in it)
    current_scene = root.get_child(root.get_child_count() - 1)
    ui_mouseover = mouseover_sound.instance()
    ui_select = select_sound.instance()
    game_shoot_a = load_shoot_a
    game_shoot_mob_d = load_shoot_mob_d
    game_hit_mob = load_hit_mob
    game_hit_player = load_hit_player
    game_death_mob = load_death_mob
    game_death_player = load_death_player
    game_pickup_coin = load_pickup_coin
    game_pickup_pu = load_pickup_pu
    game_pickup_pu2 = load_pickup_pu2
    add_child(ui_mouseover)
    add_child(ui_select)
    add_child(game_shoot_a)
    add_child(game_shoot_mob_d)
    add_child(game_hit_mob)
    add_child(game_hit_player)
    add_child(game_death_mob)
    add_child(game_death_player)
    add_child(game_pickup_coin)
    add_child(game_pickup_pu)
    add_child(game_pickup_pu2)

func sfx_mo():
    ui_mouseover.play()
    
func sfx_sel():
    ui_select.play()

func sfx_shoot_a():
    game_shoot_a.play()
    
func sfx_shoot_mob_d():
    game_shoot_mob_d.play()

func sfx_hit_mob():
    game_hit_mob.play()
    
func sfx_hit_player():
    game_hit_player.play()
    
func sfx_death_mob():
    game_death_mob.play()
    
func sfx_death_player():
    game_death_player.play()
    
func sfx_pickup_coin():
    game_pickup_coin.play()
    
func sfx_pickup_pu():
    game_pickup_pu.play()
    
func sfx_pickup_pu2():
    game_pickup_pu2.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
