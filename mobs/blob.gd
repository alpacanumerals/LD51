extends KinematicBody2D

signal killed

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    var play_area = get_parent()
    connect("killed", play_area, "_on_Mob_killed")

func hit():
    emit_signal("killed")
    queue_free()
