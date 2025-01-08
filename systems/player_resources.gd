extends Node

signal planks_updated(new_amount: int)

var planks: int = 0


func add_planks(amount: int):
	if (amount < 0):
		return
	planks += amount
	planks_updated.emit(planks)


func try_spend_planks(amount: int):
	if (amount < 0):
		return false
	if (planks < amount):
		return false
	planks -= amount
	planks_updated.emit(planks)
	return true
