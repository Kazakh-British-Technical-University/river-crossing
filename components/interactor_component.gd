extends Area2D


var interactable_list = []


func _ready():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)
	

func interact():
	if (len(interactable_list) == 0):
		return
	_get_priority_interactable().interact()


func _get_priority_interactable():
	var priority_interactable = interactable_list[0]
	var min_angle = abs(get_angle_to(interactable_list[0].global_position))
	for interactable in interactable_list:
		var angle = abs(get_angle_to(interactable.global_position))
		print(angle / 2 / PI * 360 )
		if (angle < min_angle):
			priority_interactable = interactable
			min_angle = angle
	
	return priority_interactable


func on_area_entered(area):
	if (area is InteractableComponent && area not in interactable_list):
		interactable_list.append(area)


func on_area_exited(area):
	if (area in interactable_list):
		interactable_list.erase(area)
