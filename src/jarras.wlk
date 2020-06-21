import marcas.*
class Jarra {
	var property capacidad
	var property marca
	
	method contenidoAlchol(){
		return capacidad * (marca.graduacionAlcoholica()*0.1)
	}
}
