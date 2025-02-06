extends Area2D


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if (body is Player):
		body.win()
		get_tree().create_timer(2).timeout.connect(_change_level)


func _change_level():
	LevelManager.load_next_level()
