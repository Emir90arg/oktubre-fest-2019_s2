import marcas.*
import jarras.*	
import personas.*

class Carpa{
	var property limitePersonas	 = 0
	var property tieneBanda = true
	var property cervezaALaVenta 
	var property personasDentro = []
	
	method cantidadDePersonasDentro(){
		return personasDentro.size()
	}
	method retirarPersona(persona){
		personasDentro.remove(persona)
	}
	method personaEstaEnCarpa(persona){
		return personasDentro.contains(persona)
	}
	method aEstaPersonaLeGustaEstaCarpa(persona){
		return persona.leGustaEstaCarpa(self)
	}
	method tieneLugar(){
		return self.cantidadDePersonasDentro() < limitePersonas
	}
	method puedeEntrarPersona(persona){
		return self.tieneLugar() and not(persona.estaEbria()) and 
			persona.leGustaEstaCarpa(self)
	}
	method ingresarPersona(persona){
		if (self.puedeEntrarPersona(persona)){
			personasDentro.add(persona)
		}
		else {
			throw new Exception(message = "Error carpa llena, esta ebria o no le gusta")
			//throw "Error carpa llena ..."
		}
	}
	method servirJarra(persona,capacidadDeJarra){
		if (self.personaEstaEnCarpa(persona)){
			persona.comprarJarra(
				new Jarra(marca=cervezaALaVenta,capacidad=capacidadDeJarra))			
		}
		else{
			throw new Exception(message = "La persona no esta en la carpa")
		}
	}
	method cuantosEbriosEmpedernidosHay(){
		return personasDentro.count({persona=> persona.esEbrioEmpedernido()})
	}
	method cantidadPatriotas(){
		return personasDentro.count({persona=> persona.esPatriota()})
	}	
}