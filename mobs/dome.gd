extends KinematicBody2D

signal killed
signal enemy_shoot(bullet, direction, location)

var Bullet = preload("res://bullet/MobBullet.tscn")

# these depend on the node structure of the parent scene, with the PlayArea directly above the mobs
onready var play_area = get_parent()
onready var player = get_parent().get_node("PlayerRoot")

const shot_interval = 2
var shot_timer
var hp = 1
# initialisation for the dome.
# starts animation, adds to the 'mob' group
# connects the 'killed' signal to the play_area script's '_on_Mob_killed' method
# and also its 'shoot' signal
# and initialises the shot timer
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
    
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        if collision.collider.has_method("player_touch"):
            collision.collider.player_touch()


func shoot():
    var direction_to_player = position.angle_to_point(player.position) + rng.rng.randfn(0.0,0.1)
    emit_signal("enemy_shoot", Bullet, direction_to_player, position)

func hit():
    hp -= 1
    if hp <= 0:
        dead()
    else:
        sounds.sfx_hit_mob()

func dead():
    sounds.sfx_death_mob()
    emit_signal("killed")
    call_deferred("queue_free")

func mob_touch(node):
    if node.has_method("player_touch"):
        node.player_touch()
