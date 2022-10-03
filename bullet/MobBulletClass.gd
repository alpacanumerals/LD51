extends Area2D

class_name MobBullet

export (int) var speed = 150
export (int) var damage = 1
var velocity = Vector2()

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
    add_to_group(constants.BULLET_GROUP)
    $AnimatedSprite.play()
    sounds.sfx_shoot_mob_d()
    connect("body_entered", self, "_on_MobBullet_body_entered")
    connect("area_entered", self, "_on_MobBullet_area_entered")

func _physics_process(delta):
    velocity = Vector2(-speed*delta, 0).rotated(rotation)
    position = position + velocity
    
func _on_MobBullet_body_entered(body):
    if body.has_method("player_hit"):
        body.player_hit(damage)
    call_deferred("queue_free")

func _on_MobBullet_area_entered(area):
    #if area.has_method("player_hit"):
    #   area.player_hit(damage)
    call_deferred("queue_free")
