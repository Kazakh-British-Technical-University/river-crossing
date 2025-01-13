extends Node


@export var levels: Array[PackedScene]
@export var next_level_index = 0


var current_level


func load_next_level():
	if (next_level_index >= len(levels)):
		return
	if (current_level != null):
		current_level.queue_free()
	load_level(next_level_index)
	next_level_index += 1


func load_level(index):
	current_level = levels[index].instantiate()
	add_child(current_level)
