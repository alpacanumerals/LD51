extends Label

func _on_GameRoot_set_floor(floor_number):
    set_text("B" + str(floor_number))
