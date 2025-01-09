extends Label


func _ready():
	text = str(PlayerResources.planks)
	PlayerResources.planks_updated.connect(_on_planks_updated)


func _on_planks_updated(amount):
	text = str(amount)
