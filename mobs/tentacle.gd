extends KinematicBody2D

signal killed
onready var play_area = get_parent()
var hp = 2

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")

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

func _on_Tentacle_body_entered(body):
    if body.has_method("player_touch"):
        body.player_touch()
