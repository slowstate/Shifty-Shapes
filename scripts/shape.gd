extends Node2D

@onready var game_manager = get_parent().get_node("%GameManager")
@onready var timer = $Timer

const SPEED = 300
var rot_speed

func _ready():
	rot_speed = deg_to_rad(randi() % 360 - 180)
	
func _process(delta):
	rotate(rot_speed * delta)
	position.y += SPEED * delta

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	queue_free()

func _on_body_entered(body):
	game_manager.player_died()
