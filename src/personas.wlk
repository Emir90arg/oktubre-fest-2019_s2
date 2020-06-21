import jarras.*
import marcas.*
import carpas.*
class Persona {
	var property peso = 0
	var property jarrasCompradas = []
	var property gustaMusicaTradicional = true
	var property nivelDeAguante = 0
	
	method comprarJarra(jarra){
		jarrasCompradas.add(jarra)
	}
	method totalAlcoholIngerido(){
		return jarrasCompradas.sum({jarra=> jarra.contenidoAlchol()})
	}	
	method estaEbria(){
		return self.totalAlcoholIngerido()* peso > nivelDeAguante
	}
	method leGustaEstaCerveza(marca)
	
	method leGustaEstaCarpa(carpa){
		return self.leGustaEstaCerveza(carpa.cervezaALaVenta()) and
			self.gustaMusicaTradicional() == carpa.tieneBanda()
	}
	method esEbrioEmpedernido(){
		return jarrasCompradas.all({jarra=> jarra.capacidad() >= 1})
	}
	method nacionalidad()
	
	method cantidadJarrasCompradas(){
		return jarrasCompradas.size()
	}
	method esPatriota(){
		return jarrasCompradas.all({jarra=> jarra.marca().pais() == self.nacionalidad()})
	}
}
class Belga inherits Persona{
	override method leGustaEstaCerveza(marca){
		return marca.lupulo() > 4
	}
	override method nacionalidad(){
		return "belgica"
	}	
}
class Checo inherits Persona{
	override method leGustaEstaCerveza(cerveza){
		return cerveza.graduacionAlcoholica() > 8
	}
	override method nacionalidad(){
		return "checoslovaquia"
	}		
}
class Aleman inherits Persona{
	override method leGustaEstaCerveza(marca){
		return true
	}
	override method leGustaEstaCarpa(carpa){
		return super(carpa) and carpa.cantidadDePersonasDentro().even()
	}
	override method nacionalidad(){
		return "alemania"
	}	
}