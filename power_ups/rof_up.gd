extends Area2D

func _ready():
    add_to_group(constants.POW_GROUP)

func _on_RofUp_body_entered(body):
    if body.has_method("rof_up"):
        body.rof_up()
        call_deferred("queue_free")
