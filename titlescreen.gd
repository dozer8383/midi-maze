extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_join_game_button_pressed() -> void:
	lobby.join_game()


func _on_host_game_button_pressed() -> void:
	lobby.create_game()
