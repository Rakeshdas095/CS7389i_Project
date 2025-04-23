extends Node3D

var xr_origin: Node3D
var rotation_gain := 1.0

func _ready() -> void:
    # Point to your XR rig’s origin; adjust the path if needed
    xr_origin = get_node("../XR_Rig/XROrigin3D")  
    rotation_gain = Globals.settings.rotation_gain
    # Enable this node to receive input events
    set_process_input(true)


func _input(event: InputEvent) -> void:
    # Look for any gamepad/VR‐controller button press
    if event is InputEventJoypadButton and event.pressed:
        _on_interaction(event.device, event.button_index)


func _on_interaction(_device: int, _button: int) -> void:
    var angle := deg_to_rad(10.0 * rotation_gain)
    xr_origin.rotate_y(angle)
    print("Rotated by ", angle, " radians")