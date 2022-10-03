extends Area2D

signal circle_triggered
signal circle_active(circle)

var circle_active = false

onready var player = get_parent().get_node("PlayerRoot")

func reset_circle():
    circle_active = false
    $AnimatedSprite.set_animation("off")

func _on_PlayArea_mobs_clear():
    circle_active = true
    $AnimatedSprite.set_animation("on")
    $AnimatedSprite.play()
    if overlaps_body(player):
        emit_signal("circle_triggered")

func _on_MagicCircle_body_entered(body):
    if circle_active:
        emit_signal("circle_triggered")
