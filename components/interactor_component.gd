extends Area2D


var interactable_list = []


func _ready():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)


func _process(delta):
	if (!Input.is_action_just_pressed("interact")):
		return
	if (len(interactable_list) == 0):
		return
	_get_closest_interactable().interact()


func _get_closest_interactable():
	var closest_interactable = interactable_list[0]
	var min_distance = position.distance_to(closest_interactable.position)
	for interactable in interactable_list:
		var distance = position.distance_to(interactable.position)
		if (distance < min_distance):
			closest_interactable = interactable
			min_distance = distance
	return closest_interactable


func on_area_entered(area):
	if (area is InteractableComponent && area not in interactable_list):
		interactable_list.append(area)


func on_area_exited(area):
	if (area in interactable_list):
		interactable_list.erase(area)
