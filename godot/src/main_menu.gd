extends Node


func _on_start_game_pressed() -> void:
  get_tree().change_scene_to_packed(preload("res://scenes/in_game.tscn"))


func _on_credits_pressed() -> void:
  get_tree().change_scene_to_packed(preload("res://scenes/credits.tscn"))


func _on_quit_pressed() -> void:
  get_tree().quit(0)
