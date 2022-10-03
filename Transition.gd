extends CanvasLayer

signal ftb_done

func _ready():
    ftb()

func ftb():
        $AnimationPlayer.play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
    if anim_name == "fade to black":
        emit_signal("ftb_done")
        $AnimationPlayer.play("fade from black")
