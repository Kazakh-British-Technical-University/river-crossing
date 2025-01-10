extends Label


func _ready():
	pass
	#text = str(Global.player_resources.planks)
	#Global.player_resources.planks_updated.connect(_on_planks_updated)


func _on_planks_updated(amount):
	text = str(amount)
