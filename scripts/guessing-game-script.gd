extends Node

@onready var continues_display: Label = %ContinueDisplay
@onready var line_edit: LineEdit = %LineEdit
@onready var button: Button = %Button

var rng = RandomNumberGenerator.new()
var scene_number = rng.randi_range(1, 25)
var half_number = int(scene_number / 2)
var continues = 5


func _on_line_edit_text_submitted(new_text: String) -> void:
	rng.randomize()
	var player_number = int(line_edit.text) 
	if player_number == scene_number:
		continues_display.text = 'Sucess! '
	elif player_number <= half_number:
			continues = continues -1
			continues_display.text = 'Almost there! Continues: ' + str(continues)
	#Comparacao desnecessária a mais aqui, se o player_number for maior que scene_number então ele sempre vai ser maior ou igual que half_number, que é metade de scene_number.
	elif player_number > scene_number and player_number >= half_number:
		continues = continues -1
		continues_display.text = 'Wow there pal, slow down.'
	#Puta mensagem enigmática para representar que é maior que half_number e menor que scene_number.
	elif player_number >= half_number:
		continues = continues -1
		continues_display.text = 'A little, too much? Perhaps... Continues: ' + str(continues)
	if continues <= 0:
		button_visibility()
		continues_display.text = "The Cheese, chees’ndt. Good luck next time!"


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	

func _ready():
	continues_display.text = ''
	button_visibility()


func button_visibility():
	if continues > 0:
		button.hide()
	else:
		button.show()
