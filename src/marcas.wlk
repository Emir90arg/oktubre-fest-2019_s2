class Cerveza  {
	var property lupulo = 0
	var property pais = ""

	method graduacionAlcoholica()
}
class CervezaRubia inherits Cerveza{
	var property grad
	override method graduacionAlcoholica(){
	return grad                                                           
	}
}

class CervezaNegra inherits Cerveza{
	override method graduacionAlcoholica(){
		return graduacionReglamentaria.nivelMin() + lupulo * 2
	}
}

class CervezaRoja inherits CervezaNegra{
	override method graduacionAlcoholica(){
		return super() *  1.25
	}
}

object graduacionReglamentaria{
	method nivelMax(){
		return 15
	}
	method nivelMin(){
		return 4
	}
}