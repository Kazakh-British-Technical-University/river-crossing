extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$InteractbleComponent.interacted.connect(_on_interacted)


func _on_interacted():
	PlayerResources.add_planks(1)
	queue_free()
