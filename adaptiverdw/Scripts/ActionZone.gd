extends Area3D

func _ready() -> void:
    connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
    if body is XROrigin3D:
        # tell the RedirectionManager yourself:
        get_node("../RedirectionManager")._on_interaction()