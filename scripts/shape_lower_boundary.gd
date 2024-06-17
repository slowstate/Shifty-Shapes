extends Area2D

@onready var game_manager = %GameManager

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	game_manager.add_point()
