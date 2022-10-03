extends Label

var score = 0

func increment_score(increment):
    score += increment
    set_text("Score: " + str(score))
