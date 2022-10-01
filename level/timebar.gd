extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
    max_value = owner.max_time

func _process(delta):
    value = owner.time
