extends VBoxContainer

var heart_full = preload("res://sprites/symbols/heart_full.png")
var heart_empty = preload("res://sprites/symbols/heart_empty.png")

var internal_health = 3

func set_max_health(max_health):
    remove_children()
    
    var rows = int(max_health / 3)
    var remainder = max_health % 3
    
    for _n in range(rows):
        var container = HBoxContainer.new()
        add_child(container)
        for _m in range(3):
            var heart = TextureRect.new()
            heart.set_texture(heart_full)
            heart.add_to_group(constants.HEART_GROUP)
            container.add_child(heart)
    
    if remainder > 0:
        var container = HBoxContainer.new()
        add_child(container)
        for _m in range(remainder):
            var heart = TextureRect.new()
            heart.set_texture(heart_full)
            heart.add_to_group(constants.HEART_GROUP)
            container.add_child(heart)
    
    set_health(internal_health)
        

func set_health(health):
    internal_health = health
    var n = 0
    for container in get_children():
        for heart in container.get_children():
            if n < health:
                heart.set_texture(heart_full)
            else:
                heart.set_texture(heart_empty)
            n += 1
    
func remove_children():
    for child in get_children():
        child.free()

func zero_health():
    var hearts = get_tree().get_nodes_in_group(constants.HEART_GROUP)
    for heart in hearts:
        heart.set_texture(heart_empty)

func _on_PlayArea_update_health(health):
    set_health(health)

func _on_PlayArea_update_max_health(max_health):
    set_max_health(max_health)
