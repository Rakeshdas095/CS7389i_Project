extends Node3D

@onready var xr_origin: Node3D = get_node("../XROrigin3D")
var reset_threshold: float = 2.0
var reset_speed:     float = 1.0

func _physics_process(_delta: float) -> void:
	var dist = xr_origin.global_transform.origin.length()
	if dist > reset_threshold:
		var dir = -xr_origin.global_transform.origin.normalized()
		xr_origin.translate(dir * reset_speed * _delta)
