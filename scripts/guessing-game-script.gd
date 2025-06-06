extends Node

@onready var continues_display: Label = %ContinuesDisplay
@onready var line_edit: LineEdit = $CanvasLayer/VBoxContainer/LineEdit
@onready var button: Button = $CanvasLayer/VBoxContainer/Button



var rng = RandomNumberGenerator.new()

var scene_number = rng.randi_range(1, 25)

var half_number = int(scene_number / 2)

var continues = 5

# Handles the numbers and continues


func _on_line_edit_text_submitted(new_text: String) -> void:
	rng.randomize()
	var player_number = int(line_edit.text)
	if player_number == scene_number:
		continues_display.text = 'Sucess! ' # Try again messages
	elif player_number <= half_number:
			continues = continues -1
			continues_display.text = 'Almost there! Continues: ' + str(continues)
	elif player_number > scene_number:
		continues = continues -1
		continues_display.text = 'Wow there pal, slow down.'
	elif player_number >= half_number:
		continues = continues -1
		continues_display.text = 'A little, too much? Continues: ' + str(continues)
	if continues <= 0:
		button_visibility() 
		continues_display.text = "The Cheese, chees’ndt. Good luck next time!"







# Restarts the game
func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	
	
# Button visibility

func _ready():
	button_visibility()

# Hides the button when the player have continues

func button_visibility():
	if continues > 0:
		button.hide()
	else:
		button.show()
