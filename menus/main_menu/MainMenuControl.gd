extends Control

func _on_StartButton_pressed():
	get_tree().change_scene("res://levels/helheimr/Helheimr.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://mwenus/options_menu/OptionsMenu.tscn")
