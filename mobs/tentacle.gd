extends Area2D

signal killed

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)

func hit():
    emit_signal("killed")
    queue_free()
