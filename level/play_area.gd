extends Control

signal map_clear
signal mobs_clear
signal map_failed

signal update_health(health)

const tentacle = preload("res://mobs/Tentacle.tscn")
const blob = preload("res://mobs/Blob.tscn")
const dome = preload("res://mobs/Dome.tscn")

const atk_up = preload("res://power_ups/atk_up.tscn")
const rof_up = preload("res://power_ups/rof_up.tscn")

const power_ups = [atk_up, rof_up]

var difficulty = 1
var current_mobs

const mob_cap = 3

const pack_1 = [tentacle, blob, blob]
const pack_2 = [tentacle, tentacle, blob]
const pack_3 = [dome, dome, dome]

# this is a list of encounters
# each encounter is in the format [number, list]
# the number is the number of times the pack will be duplicated
# the list is the options for what the pack is
# a pack will be picked from the list and duplicated (number) times
# pack options are seen above. they don't need to be 3 mobs
const encounters = [[0, [[]]], # floor 0 (unused)
    [1, [pack_3, pack_3]], # floor 1
    [2, [pack_1, pack_2]], # floor 2
    [3, [pack_1, pack_2]], # floor 3
    [1, [pack_3]] # floor 4
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
    print("atk up!")

func _on_PlayerRoot_rof_up():
    print("rof up!")

func _on_PlayerRoot_player_dead():
    yield(get_tree().create_timer(0.50), "timeout")
    emit_signal("map_failed")

func _on_PlayerRoot_health_update(hp):
    emit_signal("update_health", hp)
