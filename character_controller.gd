@tool
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

func geoCoordToVec(long: float, lat: float, radius: float) -> Vector3:
	return Vector3(
		cos(lat) * cos(long), 
		sin(lat), 
		cos(lat) * sin(long)
	).normalized() * radius

func orient():
	var up = position.normalized()
	var side = Vector3(0, 1, 0).cross(up)
	var front = up.cross(side)
	look_at(position + front, up)

func _ready() -> void:
	planet = get_node("../planet")
	position = geoCoordToVec(long, lat, planet.radius)
	orient()
	print("char pos on ready: ", position)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if not Engine.is_editor_hint():
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction := (Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		if direction:
			long += direction.x * delta
			lat += -direction.z * delta
			print(long, ", ", lat)
			position = geoCoordToVec(long, lat, planet.radius)
			
			orient()
	
