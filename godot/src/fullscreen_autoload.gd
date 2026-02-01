extends Node

func _input(_event):
    # Check if the "fullscreen" input action was just pressed
    if Input.is_action_just_pressed("fullscreen"):
        toggle_fullscreen()

func toggle_fullscreen():
    # Toggle the window's fullscreen mode
    DisplayServer.window_set_mode(
        DisplayServer.WINDOW_MODE_FULLSCREEN
            if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN
            else DisplayServer.WINDOW_MODE_WINDOWED
    )
