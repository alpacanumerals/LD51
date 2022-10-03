extends Area2D

func _ready():
    add_to_group(constants.POW_GROUP)

func _on_AccUp_body_entered(body):
    if body.has_method("acc_up"):
        body.atk_up()
        call_deferred("queue_free")
