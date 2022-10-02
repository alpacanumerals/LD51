extends KinematicBody2D

signal killed

onready var player = get_parent().get_node("PlayerRoot")
onready var play_area = get_parent()

const speed = 50

func _ready():
    $AnimatedSprite.play()
    add_to_group(constants.MOB_GROUP)
    connect("killed", play_area, "_on_Mob_killed")

func hit():
    emit_signal("killed")
    call_deferred("queue_free")

func _physics_process(delta):
    var direction_to_player = position.angle_to_point(player.position)
    # I still don't understand why they go backwards here
    var velocity = Vector2(-speed, 0).rotated(direction_to_player)
    move_and_slide(velocity)
    
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        if collision.collider.has_method("player_touch"):
            collision.collider.player_touch()
