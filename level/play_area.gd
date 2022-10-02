extends Control

signal map_clear
signal mobs_clear

const tentacle = preload("res://mobs/Tentacle.tscn")
const blob = preload("res://mobs/Blob.tscn")
const dome = preload("res://mobs/Dome.tscn")

var difficulty = 1
var current_mobs

const mob_cap = 3

const pack_1 = [tentacle, blob, blob]
const pack_2 = [tentacle, tentacle, blob]
const pack_3 = [dome, dome, dome]

const encounters = [[0, [pack_1]], # floor 0 (unused)
    [1, [pack_1, pack_2]], # floor 1
    [2, [pack_1, pack_2]], # floor 2
    [3, [pack_1, pack_2]], # floor 3
    [1, [pack_3]] # floor 4
    ]

func _ready():
    reset_map()

func _on_PlayerRoot_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location

func _on_Mob_enemy_shoot(bullet, direction, location):
    print("mob shot")
    pass

func reset_map():
    $TileMap.draw_map()
    reset_player()
    reset_portal()
    reset_mobs()
    remove_bullets()

func reset_player():
    var start_block = $TileMap.get_start_block()
    
    var x = (32 * 4) + (32 * 8 * (start_block % 3))
    var y = (32 * 4) + (32 * 8 * int(start_block / 3))
    
    $PlayerRoot.position = Vector2(x, y)

func reset_mobs():
    var mobs = get_tree().get_nodes_in_group(constants.MOB_GROUP)
    for mob in mobs:
        mob.queue_free()
    current_mobs = 0
    
    var spawns = $TileMap.get_mob_starts()
    
    var adj_difficulty = difficulty
    if adj_difficulty > encounters.size():
        adj_difficulty = encounters.size()
    
    var encounter = encounters[difficulty]
    var pack = encounter[1][rng.rng.randi() % encounter[1].size()]
    var pack_count = encounter[0]
    
    mobs = []
    for n in range(pack_count):
        mobs.append_array(pack)
    
    mobs = mobs.slice(0, spawns.size()-1)
    
    for n in mobs.size():
        var mob = mobs[n]
        var spawn = spawns.pop_at(rng.rng.randi() % spawns.size())
        var m = mob.instance()
        add_child(m)
        var x = spawn[0] * 32
        var y = spawn[1] * 32
        m.position = Vector2(x, y)
        current_mobs += 1

func remove_bullets():
    var bullets = get_tree().get_nodes_in_group(constants.BULLET_GROUP)
    for bullet in bullets:
        bullet.queue_free()
    
func _on_Mob_killed():
    decrement_mobs()

func decrement_mobs():
    current_mobs -= 1
    if current_mobs <= 0:
        emit_signal("mobs_clear")

func reset_portal():
    $MagicCircle.reset_circle()
    var start_block = $TileMap.get_start_block()
    
    var x = (32 * 4) + (32 * 8 * (start_block % 3))
    var y = (32 * 4) + (32 * 8 * int(start_block / 3))
    
    $MagicCircle.position = Vector2(x, y)

func _on_GameRoot_reset_map():
    difficulty += 1
    reset_map()

func _on_MagicCircle_circle_triggered():
    emit_signal("map_clear")
