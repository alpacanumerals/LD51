extends Control

signal map_clear
signal mobs_clear

const tentacle = preload("res://mobs/Tentacle.tscn")
const blob = preload("res://mobs/Blob.tscn")

var difficulty = 1
var current_mobs

const mob_cap = 3

func _ready():
    reset_map()

func _on_PlayerRoot_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location

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
    
    var possible_starts = $TileMap.get_mob_starts()
    var actual_starts = []
    
    var hard_mobs = 0
    var adj_difficulty = difficulty
    while adj_difficulty > possible_starts.size() || adj_difficulty > mob_cap:
        hard_mobs += 1
        adj_difficulty -= 1
    
    for n in range(adj_difficulty):
        if (possible_starts.size() > 0):
            var index = randi() % possible_starts.size()
            var start = possible_starts.pop_at(index)
            actual_starts.push_back(start)
    
    for start in actual_starts:
        var m = blob.instance()
        if hard_mobs > 0:
            m = tentacle.instance()
            hard_mobs -= 1
        add_child(m)
        var x = start[0] * 32
        var y = start[1] * 32
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
