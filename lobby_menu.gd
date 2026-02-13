extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	lobby.load_game.rpc("./game.tscn")

func _on_quit_button_pressed() -> void:
	lobby.remove_multiplayer_peer()

func _on_join_game_button_pressed() -> void:
	$RoomControls/VBoxContainer/StartButton.text = "WAITING ON SERVER..."
	$RoomControls/VBoxContainer/StartButton.disabled = true
	

func _on_host_game_button_pressed() -> void:
	$RoomControls/VBoxContainer/StartButton.text = "START GAME"
	$RoomControls/VBoxContainer/StartButton.disabled = false
