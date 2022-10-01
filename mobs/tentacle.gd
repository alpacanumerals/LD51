extends Area2D

func _ready():
    $AnimatedSprite.play()
    add_to_group("mobs")

func hit():
    queue_free()
