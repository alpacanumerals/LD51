extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var direction_to_mouse = Vector2()

signal shoot(bullet, direction, location)
var Bullet = preload("res://bullet/Bullet.tscn")

var rof = 16
var rof_count = 0
var acc = 0.1

func _ready():
    $AnimatedSprite.play()
    $HitHalo.play()

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

func process_shoot():
    if Input.is_action_pressed("ui_shoot"):
        if rof_count == 0:
            rof_count = rof
            var shot_direction = direction_to_mouse + rng.rng.randfn(0.0,acc)
            emit_signal("shoot", Bullet, shot_direction, position)
        else:
           rof_count = rof_count - 1

func _physics_process(delta):
    process_movement_input()
    velocity = move_and_slide(velocity)
    
    direction_to_mouse = global_position.angle_to_point(get_global_mouse_position())
    set_animation(direction_to_mouse)
    
    process_shoot()

func set_animation(direction_to_mouse):
    if (direction_to_mouse > 0 && direction_to_mouse < PI/2):
        $AnimatedSprite.animation = "back_left"
        $HitHalo.set_z_index(2)
    if (direction_to_mouse > PI/2):
        $AnimatedSprite.animation = "back_right"
        $HitHalo.set_z_index(2)
    if (direction_to_mouse < 0 && direction_to_mouse > -PI/2):
        $AnimatedSprite.animation = "front_left"
        $HitHalo.set_z_index(0)
    if (direction_to_mouse < -PI/2):
        $AnimatedSprite.animation = "front_right"
        $HitHalo.set_z_index(0)
