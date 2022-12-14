extends Control

signal map_clear
signal mobs_clear
signal map_failed
signal stop_play

signal update_health(health)

signal update_max_health(max_health)
signal atk_up
signal rof_up
signal spd_up

signal score_up(score)

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
const spd_up = preload("res://power_ups/spd_up.tscn")
const hp_up = preload("res://power_ups/hp_up.tscn")

const coin = preload("res://power_ups/coin.tscn")

const power_ups = [atk_up, rof_up, spd_up, hp_up]

var difficulty = 1
var current_mobs

const pack_1 = [tentacle,tentacle]
const pack_2 = [blob,blob]
const pack_3 = [blob,blob,blob]
const pack_4 = [blob,tentacle]
const pack_5 = [dome,dome,dome]
const pack_6 = [tentacle,dome]
const pack_7 = [blob,dome]
const pack_8 = [dome,dome]
const pack_9 = [orange,blob,blob]
const pack_10 = [orange,dome,dome]
const pack_11 = [orange,blob,blob,dome]
const pack_12 = [orange,blob,dome,dome]
const pack_13 = [amogus,tentacle,dome,dome]
const pack_13a = [amogus,tentacle,tentacle,dome]
const pack_14 = [flower,amogus,amogus,amogus]
const pack_14a = [flower,flower,amogus,amogus]
const pack_14x = [flower,flower,orange,orange]
const pack_14b = [orange,flower,flower,amogus,amogus]
const pack_14c = [flower,flower,flower,amogus,amogus]
const pack_15 = [ghost,ghost,ghost,ghost]
const pack_16 = [ghost,ghost,amogus,amogus]
const pack_16a = [orange,ghost,ghost,amogus]
const pack_16b = [ghost,amogus,amogus,amogus]
const pack_17 = [orange,amogus,amogus]
const pack_18 = [amogus,amogus,amogus]
const pack_19a = [orange,flower,amogus,amogus]
const pack_19b = [orange,flower,ghost,]
const pack_19c = [orange,ghost,amogus]
const pack_19d = [flower,ghost,amogus]
const pack_20a = [flower,amogus]
const pack_20b = [flower,ghost]
const pack_20c = [flower,orange]
const pack_20d = [orange,amogus]
const pack_20e = [orange,ghost]
const pack_20f = [ghost,ghost]
const pack_21 = [tendrils,ghost,amogus,amogus]
const pack_21a = [tendrils,flower,amogus,amogus]
const pack_21b = [tendrils,ghost,ghost,flower]
const pack_22 = [tendrils,ghost,ghost]
const pack_22a = [tendrils,flower,flower]
const pack_22b = [tendrils,tendrils,ghost]
const pack_22c = [tendrils,tendrils,flower]
const pack_23 = [time,time]
const pack_24 = [tendrils,time,time]
const pack_25 = [tendrils,ghost,ghost]
const pack_25b = [tendrils,ghost]
const pack_25c = [tendrils,time]
const pack_26 = [prism,tendrils,tendrils,tendrils,tendrils,time,time,time]
const pack_27 = [prism,tendrils,ghost,ghost]
const pack_27a = [prism,tendrils,ghost,time]
const pack_28 = [prism,tendrils]
const pack_29 = [floater,prism,tendrils,time,time,time,time,time]
const pack_30 = [floater,tendrils,tendrils,time,time,time,time,time]
const pack_31 = [floater,prism,prism,time,time,time,time,time]
const pack_32 = [tendrils]
const pack_33 = [floater,tendrils,time,time,time,time]
const pack_34 = [floater,prism,time,time,time,time]
const pack_35 = [floater]
const pack_36 = [floater,prism,tendrils,time]

# this is a list of encounters
# each encounter is in the format [number, list]
# the number is the number of times the pack will be duplicated
# the list is the options for what the pack is
# a pack will be picked from the list and duplicated (number) times
# pack options are seen above. they don't need to be 3 mobs
const encounters = [[0, [[]]], # floor 0 (unused)
    [1, [pack_1]], # floor 1
    [1, [pack_2]], # floor 2
    [1, [pack_3]], # floor 3
    [2, [pack_4]], # floor 4
    [1, [pack_5]],
    [2, [pack_6,pack_7]],
    [2, [pack_1,pack_2,pack_8]],
    [3, [pack_1,pack_2,pack_8]],
    [3, [pack_4,pack_6,pack_7]],
    [4, [pack_4,pack_6,pack_7]], #10
    [2, [pack_11,pack_12]],
    [3, [pack_9,pack_10]],
    [2, [pack_13,pack_13a]], #13
    [3, [pack_18]],
    [3, [pack_17]], #15
    [2, [pack_14]], #16
    [2, [pack_14a,pack_14x]], #17
    [2, [pack_14b,pack_14c]],
    [2, [pack_15]],
    [3, [pack_16,pack_16a,pack_16b]], #20
    [5, [pack_20a,pack_20b,pack_20d,pack_20e,pack_20f]],
    [3, [pack_19a,pack_19b,pack_19c,pack_19d]], #22
    [2, [pack_21,pack_21a,pack_21b]], #23
    [3, [pack_22,pack_22a]],
    [3,	[pack_22b,pack_22c]],
    [4, [pack_23]], #26
    [3, [pack_24,pack_25]],
    [4, [pack_24,pack_25]],
    [5, [pack_25b,pack_25c]],
    [6, [pack_23]], #30	
    [1, [pack_26]], #31
    [3, [pack_27,pack_27a]],
    [5, [pack_28]],
    [8, [pack_23]],
    [1, [pack_29,pack_30,pack_31]], #35
    [2, [pack_33,pack_34]],
    [10, [pack_32]], #37 dps check
    [10, [pack_23]], #38 kronii check
    [3, [pack_36]],
    [8, [pack_35]], #40
    [12, [pack_35]],
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
    
    for n in range(rng.rng.randi() % 4):
        add_object(coin, spawns)
    
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
    emit_signal("score_up", floor_number)
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

func _on_PlayerRoot_score_up(score):
    emit_signal("score_up", score)

func _on_PlayerRoot_hp_up(max_hp):
    emit_signal("update_max_health", max_hp)

func _on_PlayerRoot_spd_up():
    emit_signal("spd_up")

func _on_GameRoot_stop_play():
    emit_signal("stop_play")
