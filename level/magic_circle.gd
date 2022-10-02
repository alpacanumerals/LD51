extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func reset_circle():
    $CollisionShape2D.set_disabled(true)
    
    $AnimatedSprite.stop()
    $AnimatedSprite.set_animation("default")

func _on_PlayArea_mobs_clear():
    $CollisionShape2D.set_disabled(false)
    $AnimatedSprite.play()
