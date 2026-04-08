extends Area2D

func _on_body_exited(body):
	if body.is_in_group("kill"):
		get_tree().reload_current_scene()
