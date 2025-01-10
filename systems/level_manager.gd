extends Node
class_name LevelManager


@export var levels: Array[PackedScene]
@export var current_level_index = 0


var current_level


func _ready():
	current_level = levels[current_level_index].instantiate()
	add_child(current_level)


func load_next_level():
	current_level.queue_free()
	current_level_index += 1
	if (current_level_index >= len(levels)):
		return
	load_level(current_level_index)


func load_level(index):
	current_level = levels[index].instantiate()
	add_child(current_level)
