extends TextureProgress


func _ready():
    max_value = owner.max_time

func _process(delta):
    max_value = owner.max_time
    value = owner.time
