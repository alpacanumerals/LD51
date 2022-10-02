extends Area2D

signal killed
onready var play_area = get_parent()

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")

func hit():
    emit_signal("killed")
    queue_free()
