# extends Node3D

# var xr_origin: Node3D
# var curvature_gain = 1.0
# var rate = 0.05

# func _ready():
# 	xr_origin = get_node("../XR_Rig/XROrigin")
# 	curvature_gain = Globals.settings.curvature_gain

# func _physics_process(delta):
# 	var adjust = rate * curvature_gain * delta
# 	xr_origin.rotate_y(adjust)

extends Node3D

@onready var xr_origin: Node3D = get_node("../XR_Rig/XROrigin3D")
var curvature_gain: float = 1.0
var curvature_rate: float  = 0.05

func _ready() -> void:
    curvature_gain = Globals.settings.curvature_gain

func _physics_process(_delta: float) -> void:
    var adjust = curvature_rate * curvature_gain * _delta
    xr_origin.rotate_y(adjust)
