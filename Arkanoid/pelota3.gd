extends CharacterBody2D


const velocidadLimite =  600
const velocidadIni = 300
var velocidadAumentada = 1.05
var posicion_inicial: Vector2

func _ready() -> void:
	add_to_group("pelota")
	velocity = Vector2(0,1) * velocidadIni
	posicion_inicial = global_position
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		if velocity.length() < velocidadLimite:
			
			calcular_velocidad(collision)
		
		else:
			velocidadAumentada=1
			calcular_velocidad(collision)
			
		
func calcular_velocidad (collision):
	var collider = collision.get_collider()
	velocity = velocity.bounce(collision.get_normal())*velocidadAumentada
	if collider.has_method("recibir_golpe"):
		collider.recibir_golpe()
	

func reiniciar():  
	if not is_inside_tree():
		return
	var paletas = get_tree().get_nodes_in_group("paleta")
	if paletas.size() > 0:
		global_position = paletas[0].global_position + Vector2(0, -50) 
	velocidadAumentada = 1.05
	velocity = Vector2(0, 1) * velocidadIni
	
