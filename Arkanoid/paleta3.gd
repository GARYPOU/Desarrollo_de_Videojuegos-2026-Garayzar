extends CharacterBody2D


const SPEED = 600.0
var vidas = 3
@onready var sprite_vida1 = $Vida1
@onready var sprite_vida2 = $Vida2
@onready var sprite_vida3 = $Vida3

func _ready() -> void:
	add_to_group("paleta")
	
	
func _physics_process(delta: float) -> void:
	
	
	var direccion := Input.get_axis("ui_left","ui_right")
	if direccion:
		velocity.x = direccion * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	move_and_slide()


	

	
	

func restarVidas():
	vidas=vidas-1
	if vidas == 2:
		sprite_vida1.visible = false
		sprite_vida2.visible = true
		sprite_vida3.visible = true
	elif vidas == 1:
		sprite_vida1.visible = false
		sprite_vida2.visible = false
		sprite_vida3.visible = true
	if vidas == 0:
		sprite_vida1.visible = false
		sprite_vida2.visible = false
		sprite_vida3.visible = false
		get_tree().change_scene_to_file("res://menu_derrota.tscn")
	
		
		
	
