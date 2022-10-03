extends Control

signal map_clear
signal mobs_clear
signal map_failed

signal update_health(health)
signal atk_up
signal rof_up
signal spd_up


const tentacle = preload("res://mobs/Tentacle.tscn")
const blob = preload("res://mobs/Blob.tscn")
const dome = preload("res://mobs/Dome.tscn")

const orange = preload("res://mobs/Orange.tscn")
const amogus = preload("res://mobs/Amogus.tscn")
const flower = preload("res://mobs/Flower.tscn")
const ghost = preload("res://mobs/GreenGhost.tscn")

const tendrils = preload("res://mobs/Tendrils.tscn")
const time = preload("res://mobs/TSpider.tscn")
const prism = preload("res://mobs/Prism.tscn")
const floater = preload("res://mobs/Floater.tscn")


const atk_up = preload("res://power_ups/atk_up.tscn")
const rof_up = preload("res://power_ups/rof_up.tscn")

const power_ups = [atk_up, rof_up]

var difficulty = 1
var current_mobs

const pack_1 = [tentacle,tentacle]
const pack_2 = [blob,blob]
const pack_3 = [dome,dome]
const pack_4 = [blob,blob,blob]
const pack_5 = [tentacle,tentacle,tentacle]
const pack_6 = [dome,dome,dome]
const pack_7 = [blob,blob,tentacle,tentacle]
const pack_8 = [blob,blob,dome,dome]
const pack_9 = [tentacle,tentacle,dome,dome]
const pack_10 = [blob,tentacle,dome]

const pack_11 = [orange,orange,blob,blob,blob,blob,dome,dome]
const pack_12 = [orange,orange,blob,blob,dome,dome,dome,dome]
const pack_13 = [amogus,amogus,tentacle,tentacle,dome,dome,dome,dome]
const pack_14 = [flower,flower,tentacle,tentacle,blob,blob,blob,blob]
const pack_15 = [ghost,ghost]
const pack_16 = [ghost,ghost,ghost]
const pack_17 = [amogus,amogus]
const pack_18 = [amogus,amogus,amogus]
const pack_19 = [orange,orange,orange]
const pack_20 = [flower,flower,flower]

const pack_21 = [tendrils,tendrils]
const pack_22 = [tendrils,tendrils,tendrils]
const pack_23 = [time,time]
const pack_24 = [time,time,time]
const pack_25 = [prism]
const pack_26 = [prism,prism]
const pack_27 = [prism,prism,prism]
const pack_28 = [floater]
const pack_29 = [floater,floater]
const pack_30 = [floater,floater,floater]

# this is a list of encounters
# each encounter is in the format [number, list]
# the number is the number of times the pack will be duplicated
# the list is the options for what the pack is
# a pack will be picked from the list and duplicated (number) times
# pack options are seen above. they don't need to be 3 mobs
const encounters = [[0, [[]]], # floor 0 (unused)
    [1, [pack_1]], # floor 1
    [1, [pack_2]], # floor 2
    [1, [pack_4]], # floor 3
    [1, [pack_7]], # floor 4
    [1, [pack_6]],
    [1, [pack_8, pack_9, pack_10]],
    [2, [pack_1,pack_2,pack_3]],
    [2, [pack_1,pack_2,pack_3,pack_4,pack_5,pack_6]],
    [2, [pack_4,pack_5,pack_6,pack_7,pack_8,pack_9]],
    [3, [pack_4,pack_5,pack_6,pack_10]], #10
    [1, [pack_11,pack_12]],
    [2, [pack_7,pack_8,pack_9,pack_19]],
    [1, [pack_13]],
    [2, [pack_17,pack_18,pack_19]],
    [1, [pack_14]],
    [4, [pack_7,pack_8,pack_9]],
    [2, [pack_14, pack_20]],
    [3, [pack_15,pack_17,pack_18,pack_19,pack_20]],
    [3, [pack_15,pack_16,pack_17,pack_18,pack_19,pack_20]],
    [3, [pack_16,pack_18,pack_19,pack_20]], #20
    [3, [pack_16,pack_18,pack_19,pack_20,pack_21]],
    [3, [pack_16,pack_18,pack_20,pack_21,pack_22]],
    [4, [pack_23,pack_24]],
    [3, [pack_16,pack_20,pack_21,pack_22,pack_23,pack_24]],
    [4, [pack_20,pack_25]],
    [3, [pack_16,pack_22,pack_24,pack_25,pack_26]],
    [3, [pack_16,pack_22,pack_24,pack_25,pack_26,pack_27]],
    [3, [pack_26,pack_27]],
    [3, [pack_16,pack_22,pack_24,pack_26,pack_27]],
    [3, [pack_22,pack_24,pack_26,pack_27,pack_28]], #30	
    [3, [pack_22,pack_24,pack_27,pack_28]],
    [5, [pack_16]],
    [4, [pack_22]],
    [3, [pack_22,pack_24,pack_27,pack_29]],
    [4, [pack_27]],
    [4, [pack_24,pack_27,pack_29]],
    [4, [pack_27,pack_29]],
    [4, [pack_27,pack_30]],
    [4, [pack_30]],
    [5, [pack_30]], #40
    ]

func _ready():
    reset_map()

func _on_PlayerRoot_shoot(bullet, direction, location, speed):
    var b = bullet.instance()
    b.speed = speed
    add_child(b)
    b.rotation = direction
    b.position = location

func _on_Mob_enemy_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location

func reset_map():
    $TileMap.draw_map()
    reset_player()
    reset_portal()
    clear_mobs()
    clear_power_ups()
    clear_bullets()
    populate_map()

func reset_player():
    var start_block = $TileMap.get_start_block()
    
    var x = (32 * 4) + (32 * 8 * (start_block % 3))
    var y = (32 * 4) + (32 * 8 * int(start_block / 3))
    
    $PlayerRoot.position = Vector2(x, y)
    $PlayerRoot.reset_hp()
    emit_signal("update_health", $PlayerRoot.hp)

func clear_mobs():
    var mobs = get_tree().get_nodes_in_group(constants.MOB_GROUP)
    for mob in mobs:
        mob.call_deferred("queue_free")
    current_mobs = 0

func clear_power_ups():
    var p_ups = get_tree().get_nodes_in_group(constants.POW_GROUP)
    for p_up in p_ups:
        p_up.call_deferred("queue_free")

func populate_map():
    var spawns = $TileMap.get_mob_starts()
    
    var adj_difficulty = difficulty
    if adj_difficulty > encounters.size()-1:
        adj_difficulty = encounters.size()-1
    
    var encounter = encounters[adj_difficulty]
    var pack = encounter[1][rng.rng.randi() % encounter[1].size()]
    var pack_count = encounter[0]
    
    var power_up = power_ups[rng.rng.randi() % power_ups.size()]
    add_object(power_up, spawns)
    
    var mobs = []
    for n in range(pack_count):
        mobs.append_array(pack)
    
    mobs = mobs.slice(0, spawns.size()-1)
    
    for n in mobs.size():
        var mob = mobs[n]
        add_object(mob, spawns)
        current_mobs += 1

func add_object(object, spawns):
    var spawn = spawns.pop_at(rng.rng.randi() % spawns.size())
    var o = object.instance()
    call_deferred("add_child", o)
    var x = spawn[0] * 32
    var y = spawn[1] * 32
    o.position = Vector2(x, y)

func clear_bullets():
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
    reset_map()

func _on_GameRoot_set_floor(floor_number):
    difficulty = floor_number

func _on_MagicCircle_circle_triggered():
    emit_signal("map_clear")

func _on_PlayerRoot_atk_up():
    emit_signal("atk_up")

func _on_PlayerRoot_rof_up():
    emit_signal("rof_up")

func _on_PlayerRoot_player_dead():
    emit_signal("map_failed")

func _on_PlayerRoot_health_update(hp):
    emit_signal("update_health", hp)
