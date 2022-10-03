extends KinematicBody2D

export (int) var speed = 250

var velocity = Vector2()
var direction_to_mouse

signal shoot(bullet, direction, location, speed)
var Bullet = preload("res://bullet/Bullet.tscn")

signal atk_up
signal rof_up

var rof_base = 8
var rof = 8
var rof_count = 0
var acc = 0.1

const bullet_base = 400
var bullet_speed = 400
var bullet_increment = 200

func _ready():
    $AnimatedSprite.play()
    $HitHalo.animation = "default"
    $HitHalo.play()
    
# we actually don't need this since stats only reset when you die and the whole scene is reloaded
func reset_stats():
    bullet_speed = bullet_base
    rof = rof_base

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
            emit_signal("shoot", Bullet, shot_direction, position, bullet_speed)
        else:
           rof_count = rof_count - 1

func _physics_process(delta):
    direction_to_mouse = global_position.angle_to_point(get_global_mouse_position())
    process_movement_input()
    velocity = move_and_slide(velocity)
    set_animation(direction_to_mouse)  
    process_shoot()
    detect_mob_collide()
    
func detect_mob_collide():
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        if collision.collider.has_method("mob_touch"):
            collision.collider.mob_touch(self)

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

func player_hit():
    print("ping")

func player_touch():
    print("pung")

func atk_up():
    bullet_speed += bullet_increment
    emit_signal("atk_up")

func rof_up():
    rof -= 1
    if rof < 2:
        rof = 2
    emit_signal("rof_up")
