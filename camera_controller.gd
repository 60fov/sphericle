@tool
extends Camera3D

@export var height: float = 2:
	set(new_height):
		height = new_height
		update_position()

@export var distance: float = -3:
	set(new_distance):
		distance = new_distance
		update_position()

var character: CharacterBody3D
var planet: CSGSphere3D

func update_position() -> void: 
	position.y = height
	position.z = distance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_position()
	character = get_node("../")
	planet = get_node("../../planet")
	look_at(character.position, character.position.normalized())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var up = character.position.normalized()
	look_at(character.position, up)
