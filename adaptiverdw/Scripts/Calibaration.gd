extends Control

func _ready():
    var rot = $MarginContainer/VBoxContainer/HBoxContainer/RotationSlider
    var trans = $MarginContainer/VBoxContainer/HBoxContainer2/TranslationSlider
    var curv = $MarginContainer/VBoxContainer/HBoxContainer3/CurvatureSlider
    var confirm = $MarginContainer/VBoxContainer/ConfirmCalibration

    rot.value = Globals.settings.rotation_gain
    trans.value = Globals.settings.translation_gain
    curv.value = Globals.settings.curvature_gain

    rot.connect("value_changed", Callable(self, "_on_rotation_changed"))
    trans.connect("value_changed", Callable(self, "_on_translation_changed"))
    curv.connect("value_changed", Callable(self, "_on_curvature_changed"))
    confirm.connect("pressed",    Callable(self, "_on_confirm"))


func _on_rotation_changed(val):
    $MarginContainer/VBoxContainer/HBoxContainer/RotationLabel.text = "Rotation Gain: "    + str(val)

func _on_translation_changed(val):
    $MarginContainer/VBoxContainer/HBoxContainer2/TranslationLabel.text = "Translation Gain: " + str(val)

func _on_curvature_changed(val):
    $MarginContainer/VBoxContainer/HBoxContainer3/CurvatureLabel.text = "Curvature Gain: "   + str(val)


func _on_confirm():
    Globals.settings.rotation_gain    = $MarginContainer/VBoxContainer/HBoxContainer/RotationSlider.value
    Globals.settings.translation_gain = $MarginContainer/VBoxContainer/HBoxContainer2/TranslationSlider.value
    Globals.settings.curvature_gain   = $MarginContainer/VBoxContainer/HBoxContainer3/CurvatureSlider.value

    get_tree().change_scene("res://Scenes/MainVR.tscn")