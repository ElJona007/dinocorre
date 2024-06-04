extends Node2D
@export var mob_scene: PackedScene

var screen_size : Vector2i

var PlayerIntialPosition

func _ready():
	screen_size = get_window().size 
	PlayerIntialPosition = $Player.position 
	GHUD.start_game.connect(new_game)
	
func _game_game():
	GHUD.udapte_high_score_label()
	$MOBTimer.stop()
	
func new_game():
	GHUD.mob_counter = 0
	$Floor.position.x = 0
	$Player.position = PlayerIntialPosition
	$MOBTimer.start()


func _process(delta):
	$Floor.position.x = $Player.position.x - 150

func _on_timer_timeout():
	if GHUD.mob_counter < 2:
	print('cami conto:' GHUD.mob_counter ' mobs')
	var mob = mob_scene.instantite()
	mob.position.x = $Player.position.x + 1500
	mob.position.y = 640
	add_child(mob)
	mob.hit.connect(game_over):
	$MOBTimer.wait_time = 2
