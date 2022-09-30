extends Node

func _ready():
    var sound_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound"))
    var sound_slider = get_node("%SoundSlider")
    sound_slider.set_value(sound_volume)
    var music_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
    var music_slider = get_node("%MusicSlider")
    music_slider.set_value(music_volume)

func _on_BackButton_pressed():
    switcher.playClick()
    switcher.switchScene("res://Title.tscn")

func _on_SoundSlider_value_changed(value):
    var volume = clamp(value, -25, 15)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Sound"), volume)

func _on_MusicSlider_value_changed(value):
    var volume = clamp(value, -25, 15)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Music"), volume)
