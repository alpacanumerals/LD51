extends Label

var score = 0

func increment_score(increment):
    score += increment
    set_text("Score: " + str(score))
    switcher.finalscore = score

func _on_PlayArea_score_up(score):
    increment_score(score)
