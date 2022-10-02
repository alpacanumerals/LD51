extends Node

var sfx_slider_queue = false

func _ready():
    var sound_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound"))
    var sound_slider = get_node("%SoundSlider")
    sound_slider.set_value(sound_volume)
    var music_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
    var music_slider = get_node("%MusicSlider")
    music_slider.set_value(music_volume)

func _on_SoundSlider_value_changed(value):
    sfx_slider_queue = true
    var volume = clamp(value, -50, 15)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Sound"), volume)
    if volume == -50:
        AudioServer.set_bus_mute(
            AudioServer.get_bus_index("Sound"), true)
    else:
        AudioServer.set_bus_mute(
            AudioServer.get_bus_index("Sound"), false)
    if Input.is_action_pressed("ui_shoot"):
        pass
    else:
        sounds.sfx_sel()
        
func _on_MusicSlider_value_changed(value):
    var volume = clamp(value, -50, 15)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Music"), volume)
    if volume == -50:
        AudioServer.set_bus_mute(
            AudioServer.get_bus_index("Music"), true)
    else:
        AudioServer.set_bus_mute(
            AudioServer.get_bus_index("Music"), false)
            
func _on_BackButton_pressed():
    sounds.sfx_sel()
    switcher.switch_scene("res://Title.tscn")
    
func _on_BackButton_mouse_entered():
    sounds.sfx_mo()

func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and not event.pressed:
            if sfx_slider_queue:
                sfx_slider_queue = false
                sounds.sfx_sel()
