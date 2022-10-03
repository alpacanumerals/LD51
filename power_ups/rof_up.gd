extends Area2D

func _ready():
    pass # Replace with function body.

func _on_RofUp_body_entered(body):
    if body.has_method("rof_up"):
        body.rof_up()
        call_deferred("queue_free")
