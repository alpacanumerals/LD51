extends Node

export (int) var max_time = 10
var time = 10


# Called when the node enters the scene tree for the first time.
func _ready():
    time = max_time

func _physics_process(delta):
    time -= delta
    time = clamp(time, 0, max_time)
    if time <= 0:
        time_out()

func time_out():
    print("GAME OVER")
    time = max_time
