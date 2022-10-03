extends Area2D

func _ready():
    add_to_group(constants.POW_GROUP)
    $AnimatedSprite.play()

func _on_Coin_body_entered(body):
    if body.has_method("get_coin"):
        body.get_coin()
        call_deferred("queue_free")
