extends Area2D


var interactable: InteractableComponent


func _ready():
	area_entered.connect(on_body_entered)
	area_exited.connect(on_body_exited)


func _process(delta):
	if (!Input.is_action_just_pressed("interact")):
		return
	if (interactable == null):
		return
		
	interactable.interact()


func on_body_entered(area):
	if (area is InteractableComponent):
		interactable = area
		print(area)


func on_body_exited(area):
	if (area == interactable):
		interactable = null
		print("left")
