extends CanvasLayer

class_name UI

@onready var score_label = %Label
@onready var completed_ui = %GameCompleteUI

var score = 0
var max_score = 30

func update_score(value):
	score += value
	update_score_label()
	
	if score >= max_score:
		completed_ui.visible = true
		score_label.visible = false
	
func update_score_label():
	score_label.text = "Score: " + str(score)

func _on_button_pressed():
	get_tree().reload_current_scene()
