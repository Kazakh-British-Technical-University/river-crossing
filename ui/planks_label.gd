extends Label


func _ready():
	PlayerResources.planks_updated.connect(_on_planks_updated)


func _on_planks_updated(amount):
	text = str(amount)
