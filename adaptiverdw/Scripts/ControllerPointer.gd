extends XRController3D

@export var ray_path  : NodePath
@export var menu_path : NodePath

var ray  : RayCast3D
var menu : Node3D

func _ready():
    ray  = get_node(ray_path)  as RayCast3D
    menu = get_node(menu_path) as Node3D

func _input(event):
    # catch any button down on the controller
    if event is InputEventJoypadButton and event.pressed:
        if ray.is_colliding():
            menu.inject_click(ray.get_collision_point())