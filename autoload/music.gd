extends Node

var Orchestrion : AudioStreamPlayer

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    Orchestrion = AudioStreamPlayer.new()
    add_child(Orchestrion)
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func play_title():
    var music = load("res://sounds/music/cmusic.mp3")
    Orchestrion.set_bus("Music")
    Orchestrion.set_stream(music)
    Orchestrion.play()
    
func play_battle():
    var music = load("res://sounds/music/bmusic.mp3")
    Orchestrion.set_bus("Music")
    Orchestrion.set_stream(music)
    Orchestrion.play()
    
func play_gameover():
    var music = load("res://sounds/music/jingle_go.wav")
    Orchestrion.set_bus("Music")
    Orchestrion.set_stream(music)
    Orchestrion.play()
    
func pause():
    Orchestrion.set_stream_paused(true)
    
func unpause():
    Orchestrion.set_stream_paused(false)
