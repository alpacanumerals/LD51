extends KinematicBody2D

signal killed
onready var play_area = get_parent()
var hp = 2

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")

func _physics_process(delta):
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        if collision.collider.has_method("player_touch"):
            collision.collider.player_touch()

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
