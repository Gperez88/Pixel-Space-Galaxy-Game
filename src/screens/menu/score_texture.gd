extends TextureRect

func _ready():
	$label.text = str(store.best_score)
