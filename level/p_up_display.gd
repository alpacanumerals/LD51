extends HBoxContainer

const atk_up = preload("res://sprites/symbols/p_atk.png")
const rof_up = preload("res://sprites/symbols/p_rof.png")
const spd_up = preload("res://sprites/symbols/p_spd.png")

const icon_base = preload("res://level/PowerUpIcon.tscn")

func add_atk_up():
    var icon = get_p_up_icon(atk_up)
    $AtkUps.add_child(icon)

func add_rof_up():
    var icon = get_p_up_icon(rof_up)
    $RofUps.add_child(icon)

func add_spd_up():
    var icon = get_p_up_icon(spd_up)
    $SpdUps.add_child(icon)

func get_p_up_icon(image):
    var icon = icon_base.instance()
    icon.texture = image
    return icon

func _on_PlayArea_atk_up():
    add_atk_up()

func _on_PlayArea_rof_up():
    add_rof_up()

func _on_PlayArea_spd_up():
    add_spd_up()
