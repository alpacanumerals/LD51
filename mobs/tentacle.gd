extends Area2D

func _ready():
    $AnimatedSprite.play()

func hit():
    queue_free()
