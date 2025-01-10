extends Node2D

var bridge

func _ready():
	$InteractbleComponent.interacted.connect(_on_interacted)

func _on_interacted():
	if (Global.player_resources.try_spend_planks(1)):
		queue_free()
		bridge = load("res://objects/bridge/bridge.tscn").instantiate()
		bridge.position = position
		add_sibling(bridge)
	
