extends Area2D

func _ready():
    add_to_group(constants.POW_GROUP)

func _on_HpUp_body_entered(body):
    if body.has_method("hp_up"):
        body.hp_up()
        call_deferred("queue_free")
