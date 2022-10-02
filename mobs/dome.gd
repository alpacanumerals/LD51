extends Area2D

signal killed
signal enemy_shoot(bullet, direction, location)

var Bullet = preload("res://bullet/MobBullet.tscn")

onready var play_area = get_parent()
onready var player = get_parent().get_node("PlayerRoot")

const shot_interval = 1.5
var shot_timer

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")
    connect("enemy_shoot", play_area, "_on_Mob_enemy_shoot")
    shot_timer = shot_interval

func _physics_process(delta):
    shot_timer -= delta
    if shot_timer < 0:
        shoot()
        shot_timer = shot_interval

func shoot():
    var direction_to_player = position.angle_to_point(player.position)
    emit_signal("enemy_shoot", Bullet, direction_to_player, position)

func hit():
    emit_signal("killed")
    call_deferred("queue_free")
