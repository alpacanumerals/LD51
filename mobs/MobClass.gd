extends KinematicBody2D

class_name Mob

signal killed
signal enemy_shoot(bullet, direction, location)

onready var player = get_parent().get_node("PlayerRoot")
onready var play_area = get_parent()

export var speed = 0
export var hp = 1
export var acc = 0.1
export var shot_interval = 2.0
export var bullet = preload("res://bullet/MobBullet.tscn")
export var shooty = false

var flash_frames = 0
var shot_timer

func _ready():
    shot_timer = shot_interval
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")
    connect("enemy_shoot", play_area, "_on_Mob_enemy_shoot")

func _physics_process(delta):
    shot_timer -= delta
    move()
    if shooty:
        shoot()
    collide()
    
func move():
    var direction_to_player = position.angle_to_point(player.position)
    # I still don't understand why they go backwards here
    var velocity = Vector2(-speed, 0).rotated(direction_to_player)
    move_and_slide(velocity)

func shoot():
    if shot_timer < 0:
        shot_timer = shot_interval
        var direction_to_player = position.angle_to_point(player.position) + rng.rng.randfn(0.0,acc)
        emit_signal("enemy_shoot", bullet, direction_to_player, position)
        
func collide():   
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        if collision.collider.has_method("player_touch"):
            collision.collider.player_touch()
            
func mob_touch(node):
    if node.has_method("player_touch"):
        node.player_touch()

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

func flash():
    $AnimatedSprite.modulate = Color(1,0,0,1)

func deflash():
    if flash_frames >= 1:
        flash_frames -= 1
    if flash_frames <= 0:
        $AnimatedSprite.modulate = Color(1,1,1,1)
