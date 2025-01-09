extends Node2D

var bridge

func _ready():
	$InteractbleComponent.interacted.connect(_on_interacted)

func _on_interacted():
	if (bridge != null):
		$Collider/CollisionShape2D.disabled = false
		bridge.queue_free()
		PlayerResources.add_planks(1)
		bridge = null
	elif (PlayerResources.try_spend_planks(1)):
		$Collider/CollisionShape2D.disabled = true
		bridge = load("res://objects/bridge/bridge.tscn").instantiate()
		add_child(bridge)
	
