extends Camera3D

@export var height: float = 2
@export var distance: float = -3

var character: CharacterBody3D
var planet: CSGSphere3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.y = height
	self.position.z = distance
	character = get_node("../")
	planet = get_node("../../planet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var up = character.position.clampf(1, planet.radius)
	look_at(character.position, up)
