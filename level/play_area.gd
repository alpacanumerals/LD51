extends Control

func _ready():
    pass

func _on_PlayerRoot_shoot(bullet, direction, location):
    var b = bullet.instance()
    add_child(b)
    b.rotation = direction
    b.position = location
