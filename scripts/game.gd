extends Node2D

var packed_scene = [
	preload("res://scenes/shape.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	randomize()
	var random_shape_scene = packed_scene[randi() % 1].instantiate()
	random_shape_scene.position = Vector2(randf_range(-get_viewport().size.x/2, get_viewport().size.x/2-50), -get_viewport().size.y/2-50)
	add_child(random_shape_scene)
	$Timer.wait_time = randi() % 2 + 0.5
