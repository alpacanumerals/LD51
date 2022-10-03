extends KinematicBody2D

class_name MobBullet

export (int) var speed = 150
var velocity = Vector2()

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
    add_to_group(constants.BULLET_GROUP)
    $AnimatedSprite.play()
    sounds.sfx_shoot_mob_d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
    
func _on_MobBullet_body_entered(body):
    if body.has_method("player_hit"):
        body.player_hit()
    call_deferred("queue_free")

func _on_MobBullet_area_entered(area):
    if area.has_method("player_hit"):
        area.player_hit()
    call_deferred("queue_free")
