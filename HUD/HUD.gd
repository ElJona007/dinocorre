extends CanvasLayer

signal start_game 

var score = 0 
var high_score = 0 
var is_mob_on_screen = false 
var is_playing = false 

func update_score_label():
	score = score +100 
	$ScoreLabel.text = 'score: %d'%(score) 
	
func update_high_score_label():
	is_playing = false
	$ScoreTimer.stop()
	$StartButton.visible = true
	if score > high_score:
		high_score = score 
		$HighScoreLabel.text = 'High Score: %4'%(high_score)



func _on_start_button_pressed():
	score = -10
	update_score_label()
	start_game.emit()
	is_playing = true
	$ScoreTimer.start()
	$StartButton.visible = false 


func _on_score_timer_timeout():
	update_score_label()
