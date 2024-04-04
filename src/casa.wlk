object casaDePepeYJulian {
	var viveres = 50
	var montoDeReparacion = 0
	
	 method viveres(_viveres){
	 	viveres = _viveres
	 }
	 method viveres(){
	 	return viveres
	 }
	 
	 method viveresSuficientes(){
	 	return self.viveres() > 40
	 }
	 
	 method fondo(){
	 	return combinada.saldoDeCombinada()
	 }
	 
	 method montoDeReparacion(){
		return montoDeReparacion
	 }
   	 method seRompioAlgo(_montoDeReparacion){
   	   montoDeReparacion = _montoDeReparacion
   	 }
	
	 method hayQueHacerReparaciones(){     //<------------
	 	return montoDeReparacion > 1
	 }
	 
	 method casaEnOrden(){
	 	return not self.hayQueHacerReparaciones() and self.viveresSuficientes()
	 }
	 
	 method estrategiaAUsar(estrategia){
	 	return estrategia.comprar(estrategia)
	 }
}	 
//----------------------------------------------------------------------------------------------------------



object cuentaCorriente {

	var saldo = 0

	method extraer(cantidad) {
		saldo = saldo - cantidad
	}

	method depositar(cantidad) {
		saldo = saldo + cantidad
	}

	method saldo() {
		return saldo
	}

	method saldo(_saldo) {
		saldo = _saldo
	}

}

object cuentaConGastos {

	var saldo = 0
	var gastoPorOperacion = 0

	method extraer(cantidad) {
		saldo = saldo - cantidad - self.gastoPorOperacion()
	}

	method depositar(cantidad) {
		saldo = saldo + cantidad - self.gastoPorOperacion()
	}
	method gastoPorOperacion() {
		return gastoPorOperacion
	}

	method gastoPorOperacion(_gastoPorOperacion) {
		gastoPorOperacion = _gastoPorOperacion
	}

	method saldo() {
		return saldo
	}
	
	method saldo(_saldo) {
		saldo = _saldo
	}

}


object combinada {

	var cuentaPrimaria = cuentaConGastos
	var cuentaSecundaria = cuentaCorriente

	method saldoDeCombinada(){
		return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	}
	method cuentaPrimaria(_cuentaPrimaria) {
		cuentaPrimaria = _cuentaPrimaria
	}

	method cuentaSecundaria(_cuentaSecundaria) {
		cuentaSecundaria = _cuentaSecundaria
	}

	method depositar(cantidad) {
		return cuentaPrimaria.depositar(cantidad)
	}



	method extraer(cantidad) {
		return if (cantidad < cuentaPrimaria.saldo()) cuentaPrimaria.extraer(cantidad)
			   else	cuentaSecundaria.extraer(cantidad)}

}


//---------------------------------------------------------------------------------


object minimoEIndispensable{
	
	var calidad = 0
	
	method calidad(_calidad){
		calidad = _calidad
	}
	method calidad(){
		return calidad
	}
	
	
	method comprar(estrategia){
		return if (casaDePepeYJulian.viveres() < 40) estrategia.gastar()
		else casaDePepeYJulian.fondo()
	}
	
	method porcentajeAComprar(){
		return 40 - casaDePepeYJulian.viveres()
	}
	

}



object gastadoEnCompras{
	method gastar(estrategia){
		return combinada.extraer( estrategia.porcentajeAComprar() * estrategia.calidad() )
	}
}



 
 
object full{
	const calidad = 5
	method calidad(){
		return calidad
	}
	
	method comprar(estrategia){
		return if(casaDePepeYJulian.casaEnOrden()) estrategia.gastar()
		else estrategia.gastar()
	}
	method porcentajeAComprar(){
		return self.porcentajeQueCorresponde() - casaDePepeYJulian.viveres()
	}
	method porcentajeQueCorresponde(){
		return if (casaDePepeYJulian.casaEnOrden()) 100
			   else 40
	}	
	
	
	
	method repararCasa(){
		return if (self.hayFondos() and self.sobraDinero()) self.reparar()
			   else "no hay dinero" 
	}

	method hayFondos(){
		return casaDePepeYJulian.fondo() >= casaDePepeYJulian.montoDeReparacion()
	}
	method sobraDinero(){
		return casaDePepeYJulian.fondo() - casaDePepeYJulian.montoDeReparacion() > 1000 
	}
	method reparar(){
		return casaDePepeYJulian.fondo() - casaDePepeYJulian.montoDeReparacion()
	}
}


	


 
 
 
 
 
 
//VERIFICAR LOS MENSAJES QUE SE LE DA A LOS OBJETOS, UNIR COMO CORRESPONDE. A COMPLETAR