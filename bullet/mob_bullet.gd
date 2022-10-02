extends Area2D

export (int) var speed = 400
var velocity = Vector2()

signal hit

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.BULLET_GROUP)
    sounds.sfx_shoot_a()

func _physics_process(delta):
    velocity = Vector2(-speed*delta, 0).rotated(rotation)
    
    position = position + velocity

func _on_MobBullet_body_entered(body):
    if body.has_method("player_hit"):
        body.hit()
    queue_free()

func _on_MobBullet_area_entered(area):
    if area.has_method("player_hit"):
        area.hit()
    queue_free()
