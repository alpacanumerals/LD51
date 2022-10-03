extends HBoxContainer

var heart_full = preload("res://sprites/symbols/heart_full.png")
var heart_empty = preload("res://sprites/symbols/heart_empty.png")

func update_health(health):
    zero_health()
    if health >= 3:
        $Control3/Heart.set_texture(heart_full)
    if health >= 2:
        $Control2/Heart.set_texture(heart_full)
    if health >= 1:
        $Control1/Heart.set_texture(heart_full)

func zero_health():
    var hearts = get_tree().get_nodes_in_group(constants.HEART_GROUP)
    for heart in hearts:
        heart.set_texture(heart_empty)

func _on_GameRoot_update_health(health):
    update_health(health)
