# extends Node

# @onready var curv: Node3D      = $CurvatureController
# @onready var rst: Node3D       = $ResetController
# @onready var xr_origin: Node3D = $XR_Rig/XROrigin3D

# const BOUNDARY_DISTANCE: float = 2.0

# func _process(_delta: float) -> void:
#     var dist = xr_origin.global_transform.origin.length()

#     if dist > BOUNDARY_DISTANCE:
#         rst.set_physics_process(true)
#         curv.set_physics_process(false)
#     else:
#         rst.set_physics_process(false)
#         curv.set_physics_process(true)
extends Node

@onready var curv: Node3D      = $CurvatureController
@onready var rst:  Node3D      = $ResetController
@onready var xr_origin: Node3D = $XR_Rig/XROrigin3D

const BOUNDARY_DISTANCE: float = 2.0

func _process(_delta: float) -> void:
    var dist = xr_origin.global_transform.origin.length()
    if dist > BOUNDARY_DISTANCE:
        rst.set_physics_process(true)
        curv.set_physics_process(false)
    else:
        rst.set_physics_process(false)
        curv.set_physics_process(true)