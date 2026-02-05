extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 6
var jumpSpeed = 5
var mouseSensitivity = 0.005

func _ready():
	pass

func _physics_process(delta: float) -> void:
	velocity.y += -gravity * delta
	var input = Input.get_vector("left","right","forward","backward")
	var movementDirection = transform.basis * Vector3(input.x,0,input.y)
	velocity.x = movementDirection.x * speed
	velocity.z = movementDirection.z * speed
	move_and_slide()
	if input != Vector2(0,0):
		$Camera3D/AnimationPlayer.play("bob",-1,input.y*2)
	else:
		$Camera3D/AnimationPlayer.stop()
	#if is_on_floor() and Input.is_action_just_pressed("jump"):
		#velocity.y = jumpSpeed

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event.is_action_pressed("shoot"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x*mouseSensitivity)
		$Camera3D.rotate_x(-event.relative.y*mouseSensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x,-deg_to_rad(70),deg_to_rad(70))
