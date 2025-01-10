extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$InteractbleComponent.interacted.connect(on_interacted)


func on_interacted():
	Global.player_resources.add_planks(1)
	queue_free()
