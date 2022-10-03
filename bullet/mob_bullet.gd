extends Area2D

export (int) var speed = 150
var velocity = Vector2()

signal hit

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.BULLET_GROUP)
    sounds.sfx_shoot_mob_d()

func _physics_process(delta):
    velocity = Vector2(-speed*delta, 0).rotated(rotation)
    
    position = position + velocity

# these bullets are destroyed if they encounter a collision body/area
# if that body/area has the 'player_hit' method/func, i.e. is the player, that method is called
func _on_MobBullet_body_entered(body):
    if body.has_method("player_hit"):
        body.player_hit()
    call_deferred("queue_free")

func _on_MobBullet_area_entered(area):
    if area.has_method("player_hit"):
        area.player_hit()
    call_deferred("queue_free")
