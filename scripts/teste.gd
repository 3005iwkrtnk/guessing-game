extends Node2D


var rng = RandomNumberGenerator.new()

var scene_number = rng.randi_range(10, 10)

var player_number = 5

var half_number = int(scene_number / 2)

# Debug

func _ready():
	rng.randomize()
	if player_number != scene_number:
		print('player_number: ',player_number,' scene_number: ',scene_number)
	if player_number == scene_number:
		print('Sucess!: ',scene_number)
	if player_number == half_number:
			print('Almost there!')
	
	
	
