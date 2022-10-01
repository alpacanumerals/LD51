extends Control

var player_start = Vector2(386, 248)

var mob_start = Vector2(531, 264)

var tentacle = preload("res://mobs/Tentacle.tscn")

func _ready():
    reset_player()
    reset_mobs()

func _on_PlayerRoot_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location

func reset_map():
    reset_player()
    reset_mobs()
    remove_bullets()
    # reset walls

func reset_player():
    $PlayerRoot.position = player_start

func reset_mobs():
    var mobs = get_tree().get_nodes_in_group(constants.MOB_GROUP)
    for mob in mobs:
        mob.queue_free()
    var t = tentacle.instance()
    add_child(t)
    t.position = mob_start

func remove_bullets():
    var bullets = get_tree().get_nodes_in_group(constants.BULLET_GROUP)
    for bullet in bullets:
        bullet.queue_free()
