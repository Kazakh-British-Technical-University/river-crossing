extends Node


@export var _levels: Array[PackedScene]
@export var _next_level_index = 0


var _current_level


func load_next_level():
	if (_next_level_index >= len(_levels)):
		return
	load_level(_next_level_index)
	_next_level_index += 1


func load_level(index):
	PlayerResources.reset()
	if (_current_level != null):
		_current_level.queue_free()
	_current_level = _levels[index].instantiate()
	add_child(_current_level)
	

func reload_current_level():
	if (_current_level != null):
		_current_level.queue_free()
		load_level(_next_level_index - 1)
		
