extends Control

const tentacle = preload("res://mobs/Tentacle.tscn")
const mob_count = 3

func _ready():
    reset_map()
    $Navigation2D

func _on_PlayerRoot_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location

func reset_map():
    $TileMap.draw_map()
    reset_player()
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
        
    var possible_starts = $TileMap.get_mob_starts()
    
    var actual_starts = []
    for n in range(mob_count):
        var index = randi() % possible_starts.size()
        var start = possible_starts.pop_at(index)
        actual_starts.push_back(start)
    
    for start in actual_starts:
        var t = tentacle.instance()
        add_child(t)
        var x = start[0] * 32
        var y = start[1] * 32
        t.position = Vector2(x, y)

func remove_bullets():
    var bullets = get_tree().get_nodes_in_group(constants.BULLET_GROUP)
    for bullet in bullets:
        bullet.queue_free()
