# extends Node3D

# var xr_origin: Node3D
# var threshold = 2.0
# var speed = 1.0

# func _ready():
# 	xr_origin = get_node("../XR_Rig/XROrigin")

# func _physics_process(delta):
# 	var dist = xr_origin.global_transform.origin.length()
# 	if dist > threshold:
# 		var dir = -xr_origin.global_transform.origin.normalized()
# 		xr_origin.translate(dir * speed * delta)
extends Node3D

@onready var xr_origin: Node3D = get_node("../XR_Rig/XROrigin3D")
var reset_threshold: float = 2.0
var reset_speed:     float = 1.0

func _physics_process(_delta: float) -> void:
    var dist = xr_origin.global_transform.origin.length()
    if dist > reset_threshold:
        var dir = -xr_origin.global_transform.origin.normalized()
        xr_origin.translate(dir * reset_speed * _delta)