extends Area2D

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)

func hit():
    queue_free()
