extends CharacterBody3D

@export var rotation_speed: float = 1


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var planet: CSGSphere3D
var lat: float
var long: float
var look_angle: float
var lat_quat: Quaternion
var long_quat: Quaternion

func _ready() -> void:
	planet = get_node("../planet")
	var new_position = Vector3(sin(long), sin(lat), cos(long)) * planet.radius
	position = new_position

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#var delta_long: float
	
	#long_quat = Quaternion(Vector3(0, 1, 0), long)
	#lat_quat = Quaternion(Vector3(1, 0, 0), lat)
	#var new_position = Vector3(0, 0, 1) * long_quat * lat_quat
	if direction:
		long += direction.x * delta
		lat += direction.z * delta
		var new_position = Vector3(0, 0, 1).normalized() * planet.radius
		position = new_position
	#var up = new_position.normalized()
	#var left = Vector3(0, 0, 1) * Quaternion(up, look_angle)
	#var forward = up.cross(left)
	#var orientation = Basis(left, up, forward)
	#rotation = orientation.get_euler()
	
