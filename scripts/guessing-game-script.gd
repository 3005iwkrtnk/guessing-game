extends Node

@onready var label: Label = $CanvasLayer/GridContainer/Label

var rng = RandomNumberGenerator.new()

var scene_number = rng.randi_range(10, 10)

var player_number = 5

var half_number = int(scene_number / 2)

# Debug

func _ready():
	rng.randomize()
	if player_number != scene_number:
		label.text = "player_number: " + str(player_number) + " scene_number: " + str(scene_number)
	if player_number == scene_number:
		label.text = 'Sucess!: ' + str(scene_number)
	if player_number == half_number:
			label.text = 'Almost there!'
	
	
	
