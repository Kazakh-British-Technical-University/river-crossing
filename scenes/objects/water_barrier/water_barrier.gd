extends Node2D

var _bridge

func _ready():
	$InteractbleComponent.interacted.connect(_on_interacted)

func _on_interacted():
	if (PlayerResources.try_spend_planks(1)):
		queue_free()
		_bridge = load("res://scenes/objects/bridge/bridge.tscn").instantiate()
		_bridge.position = position
		add_sibling(_bridge)
	
