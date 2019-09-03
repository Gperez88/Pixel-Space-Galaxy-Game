extends TextureRect

var score = 0 setget set_score

func set_score(new_value):
	score = new_value
	
	$label.text = str(score)
	
	if score > store.best_score:
		store.best_score = score
	
