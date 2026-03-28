extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("pelota"):
		var paletas = get_tree().get_nodes_in_group("paleta")
		if paletas.size() > 0:
			paletas[0].restarVidas()
		
		
		body.reiniciar()
