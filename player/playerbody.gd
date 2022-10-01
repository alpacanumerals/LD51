extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var direction_to_mouse = Vector2()

signal shoot(bullet, direction, location)
var Bullet = preload("res://bullet/Bullet.tscn")

func _ready():
    $AnimatedSprite.play()

func process_movement_input():
    velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    velocity = velocity.normalized() * speed
    
func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed:
            emit_signal("shoot", Bullet, direction_to_mouse, position)
            
func _physics_process(delta):
    process_movement_input()
    velocity = move_and_slide(velocity)
    
    direction_to_mouse = global_position.angle_to_point(get_global_mouse_position())
    set_animation(direction_to_mouse)

func set_animation(direction_to_mouse):
    if (direction_to_mouse > 0 && direction_to_mouse < PI/2):
        $AnimatedSprite.animation = "back_left"
        #$AnimatedSprite.play()
    if (direction_to_mouse > PI/2):
        $AnimatedSprite.animation = "back_right"
        #$AnimatedSprite.play()
    if (direction_to_mouse < 0 && direction_to_mouse > -PI/2):
        $AnimatedSprite.animation = "front_left"
        #$AnimatedSprite.play()
    if (direction_to_mouse < -PI/2):
        $AnimatedSprite.animation = "front_right"
        #$AnimatedSprite.play()
