extends Control

# grab your sliders and labels
@onready var rot_slider   = $MarginContainer/VBoxContainer/HBoxContainer/RotationSlider
@onready var trans_slider = $MarginContainer/VBoxContainer/HBoxContainer2/TranslationSlider
@onready var curv_slider  = $MarginContainer/VBoxContainer/HBoxContainer3/CurvatureSlider

@onready var rot_label    = $MarginContainer/VBoxContainer/HBoxContainer/RotationLabel
@onready var trans_label  = $MarginContainer/VBoxContainer/HBoxContainer2/TranslationLabel
@onready var curv_label   = $MarginContainer/VBoxContainer/HBoxContainer3/CurvatureLabel

var sliders  : Array = []
var labels   : Array = []
var names    : Array = ["Rotation Gain", "Translation Gain", "Curvature Gain"]
var selected : int   = 0

# how much to step each press (you can tweak this)
@export_range(0.01, 1.0, 0.01) var step : float = 0.1

func _ready() -> void:
    sliders = [rot_slider, trans_slider, curv_slider]
    labels  = [rot_label, trans_label, curv_label]
    _update_ui()

func _update_ui() -> void:
    for i in range(sliders.size()):
        var prefix = "> " if i == selected else ""
        # Format the slider’s value to 2 decimal places:
        var val_str = str(sliders[i].value, 2)
        labels[i].text = "%s%s: %s" % [prefix, names[i], val_str]

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("calib_next_slider"):
        selected = (selected + 1) % sliders.size()
        _update_ui()
    elif event.is_action_pressed("calib_prev_slider"):
        selected = (selected - 1 + sliders.size()) % sliders.size()
        _update_ui()
    elif event.is_action_pressed("calib_inc_value"):
        var s = sliders[selected]
        s.value = clamp(s.value + step, s.min_value, s.max_value)
        _update_ui()
    elif event.is_action_pressed("calib_dec_value"):
        var s = sliders[selected]
        s.value = clamp(s.value - step, s.min_value, s.max_value)
        _update_ui()
    elif event.is_action_pressed("calib_confirm"):
        _on_confirm()

func _on_confirm() -> void:
    Globals.settings.rotation_gain    = rot_slider.value
    Globals.settings.translation_gain = trans_slider.value
    Globals.settings.curvature_gain   = curv_slider.value
    get_tree().change_scene("res://Scenes/MainVR.tscn")