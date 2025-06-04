extends Node2D

@onready var label: Label = $CanvasLayer/GridContainer/Label

var rng = RandomNumberGenerator.new()

var scene_number = rng.randi_range(10, 10)

var player_number = 5

var half_number = int(scene_number / 2)

var continues = 5

func _ready():
	rng.randomize()
	if player_number != scene_number:
		continues = -1
		label.text = 'Yikes! Continues:' + str(continues)
	if player_number == scene_number:
		label.text = 'Sucess!: '
	if player_number <= half_number:
			label.text = 'Almost there!'
	if player_number >= half_number:
		label.text = 'A little, too much? Perhaps ...'
	
	
