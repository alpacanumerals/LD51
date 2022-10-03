extends Area2D

func _ready():
    pass # Replace with function body.

func _on_AtkUp_body_entered(body):
    if body.has_method("atk_up"):
        body.atk_up()
        call_deferred("queue_free")
