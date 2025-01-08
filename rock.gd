extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$InteractbleComponent.interacted.connect(on_interacted)


func on_interacted():
	queue_free()

