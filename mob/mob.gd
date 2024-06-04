extends Area2D

signal start_game


func _ready():
	GHUD.mob_counter =GHUD.mob_counter +1
	var collisions = [
		$CollisionA
	]
	var sprites = [
		$CollisionA
	]
	
	var random_int = randi() % collisions.size
	var selected_collitions = collisions[random_int]
	var selected_sprite = sprites[random_int]
	selected_collitions.disabled = false
	selected_collitions.visible = true
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter -1
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
	hit.emit()
