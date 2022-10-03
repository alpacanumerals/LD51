extends Area2D

func _ready():
    add_to_group(constants.POW_GROUP)

func _on_SpdUp_body_entered(body):
    if body.has_method("spd_up"):
        body.spd_up()
        call_deferred("queue_free")
