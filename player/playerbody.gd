extends KinematicBody2D

export (int) var speed = 250

var velocity = Vector2()
var direction_to_mouse

signal shoot(bullet, direction, location, speed)
var Bullet = preload("res://bullet/Bullet.tscn")

signal atk_up
signal rof_up
signal spd_up
signal hp_up(max_hp)

signal player_dead
signal health_update(hp)
signal score_up(score)

var rof_base = 8
var rof = 8
var rof_count = 0
var acc = 0.1
var atk_stat = 1

const bullet_base = 400
var bullet_speed = 400
var bullet_increment = 100

const hp_base = 3
var max_hp = 3
var hp = max_hp

const iframes = 30
var iframe = iframes

var invuln = false
var dead = false

func _ready():
    $AnimatedSprite.play()
    $HitHalo.animation = "default"
    $HitHalo.play()

func reset_hp():
    deflash()
    hp = max_hp
    invuln = false
    iframe = iframes

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
    if !dead:
        direction_to_mouse = global_position.angle_to_point(get_global_mouse_position())
        process_movement_input()
        velocity = move_and_slide(velocity)
        set_animation(direction_to_mouse)  
        process_shoot()
        detect_mob_collide()
        handle_iframes()
    
func handle_iframes():
    if iframe < iframes:
        iframe += 1
        invuln = true
    if iframe >= iframes && !dead:
        invuln = false
        modulate.a = 1
    
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

func player_damage(damage):
    hp -= damage
    emit_signal("health_update", hp)
    if hp <= 0:
        player_kill()
    else:
        player_invuln()

func player_kill():
    dead = true
    iframe = 0
    invuln = true
    flash()
    sounds.sfx_death_player()
    emit_signal("player_dead")

func player_invuln():
    iframe = 0
    invuln = true
    modulate.a = 0.5

func player_hit(damage):
    if !invuln && !dead:
        sounds.sfx_hit_player()
        player_damage(damage)

func player_touch():
    if !invuln && !dead:
        sounds.sfx_hit_player()
        player_damage(1)

func atk_up():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_pu()
    if atk_stat <= 10:
        atk_stat += 1
        bullet_speed += bullet_increment
        emit_signal("atk_up")

func rof_up():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_pu()
    if rof > 1:
        rof -= 1
        emit_signal("rof_up")

func spd_up():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_pu()
    if speed <= 400:
        speed += 25
        emit_signal("spd_up")

func acc_up():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_pu()
    if acc > 0:
        acc -= 0.01
        emit_signal("acc_up")
        
func hp_up():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_pu()
    if max_hp < 18:
        max_hp += 1
        hp += 1
        emit_signal("hp_up", max_hp)
        emit_signal("health_update", hp)

func get_coin():
    emit_signal("score_up", 10)
    sounds.sfx_pickup_coin()

func flash():
    $AnimatedSprite.modulate = Color(1,0,0,1)

func deflash():
    $AnimatedSprite.modulate = Color(1,1,1,1)
