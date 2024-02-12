extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var ID = 1

@onready var player_body = $Body

var apple_path = 'res://Assets - Kenney/Food/apple.glb'

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	var input_dir = Input.get_vector("left" + str(ID), "right" + str(ID), "up" + str(ID), "down" + str(ID))
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		player_body.look_at(global_position - direction, Vector3.UP)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	

	
	move_and_slide()
