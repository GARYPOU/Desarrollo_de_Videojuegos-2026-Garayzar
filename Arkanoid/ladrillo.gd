extends StaticBody2D

var golpes = 0

@onready var sprite_completo = $Completo
@onready var sprite_roto = $Roto

func _ready():
	sprite_roto.visible = false  
	add_to_group("ladrillo")

func recibir_golpe():
	golpes += 1
	if golpes == 1:
		sprite_completo.visible = false
		sprite_roto.visible = true
	elif golpes >= 2:
		var marcadores = get_tree().get_nodes_in_group("marcador")
		if get_tree().get_nodes_in_group("ladrillo").size() == 1:
			get_tree().change_scene_to_file("res://menu_victoria.tscn")
		queue_free()
			
			
		
