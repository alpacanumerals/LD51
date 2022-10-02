extends TextureProgress


func _ready():
    max_value = owner.max_time

func _process(delta):
    value = owner.time
