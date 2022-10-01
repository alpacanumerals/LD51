extends KinematicBody2D

export (int) var speed = 400
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
    velocity = Vector2(speed, 0).rotated(rotation)
    
    velocity = move_and_slide(velocity)
