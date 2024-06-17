extends Sprite2D

var shape_sprites = [
	preload("res://assets/sprites/Diamond.png"),
	preload("res://assets/sprites/Hexagon.png"),
	preload("res://assets/sprites/Pentagon.png"),
	preload("res://assets/sprites/Square.png"),
	preload("res://assets/sprites/Star.png"),
	preload("res://assets/sprites/Triangle.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = shape_sprites[randi() % shape_sprites.size()]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
