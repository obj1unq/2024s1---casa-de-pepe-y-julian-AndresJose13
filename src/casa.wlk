object casaDePepeYJulian {
	var viveres = 0
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
	 method saldo(){
	 	return combinada.saldo()
	 }
	 
	 method montoDeReparacion(){
		return montoDeReparacion
	 }
   	 method seRompioAlgo(_montoDeReparacion){
   	   montoDeReparacion = _montoDeReparacion
   	 }
	
	 method hayQueHacerReparaciones(){     //<------------
	 	return montoDeReparacion > 0
	 }
	 
	 method casaEnOrden(){
	 	return not self.hayQueHacerReparaciones() and self.viveresSuficientes()
	 }
	 
	 method estrategiaAUsar(estrategia){
	 	return estrategia.comprar()
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
		saldo = saldo - cantidad
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
	
	method saldo(){
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
		return if (cantidad <= cuentaPrimaria.saldo()) cuentaPrimaria.extraer(cantidad)
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
	
	
	method comprar(){
		return if (casaDePepeYJulian.viveresSuficientes()) self.comprarViveres()
		else {}
		
	}
	
	method porcentajeAComprar(){
		return 40 - casaDePepeYJulian.viveres()
	}
	
	method comprarViveres(){
		 return combinada.extraer( self.porcentajeAComprar() * self.calidad() )
	}
}
	







 
 
object full{
	const calidad = 5
	
	method calidad(){
		return calidad
	}
	
	method comprar(){
		return if (casaDePepeYJulian.casaEnOrden()) self.comprarViveres()
			   else self.comprarViveres()
	}
	
	
	method comprarViveres(){
		combinada.extraer( self.porcentajeQueCorresponde() * self.calidad() )
		casaDePepeYJulian.viveres(self.porcentajeQueCorresponde())
	}
	
	method porcentajeQueCorresponde(){
		return if (casaDePepeYJulian.casaEnOrden()) 100
			   else casaDePepeYJulian.viveres() + 40
	}	
	
	
	
	
	
	
	method repararCasa(){
		return if (self.hayFondos() and self.sobraDinero()) self.reparar() else {} 
	}

	method repararLaCasa(){
		return self.repararSiCorresponde()
	}
	
	method repararSiCorresponde(){
		return if (casaDePepeYJulian.saldo() >= (casaDePepeYJulian.montoDeReparacion() + 1000) ) self.repararCasa() else {}
	}

	method hayFondos(){
		return casaDePepeYJulian.saldo() >= casaDePepeYJulian.montoDeReparacion()
	}
	method sobraDinero(){
		return casaDePepeYJulian.saldo() - casaDePepeYJulian.montoDeReparacion() > 1000 
	}
	method reparar(){
		return casaDePepeYJulian.saldo() - casaDePepeYJulian.montoDeReparacion()
	}
}


	

/*casaDePepeYJulian.viveres(50)
	   	casaDePepeYJulian.seRompioAlgo(100)
	   	combinada.cuentaPrimaria(cuentaCorriente)
	   	cuentaCorriente.saldo(1000)
	   	casaDePepeYJulian.estrategiaAUsar(full)
	   	full.comprar(full)
	   	full.repararCasa() 
	   	* assert.equals(casaDePepeYJulian.viveres() == 40)
	   	assert.equals(casaDePepeYJulian.montoDeReparacion() == 100)
	   	assert.equals(cuentaCorriente.saldo() == 800)*/
 
 
 
 
 
 
//VERIFICAR LOS MENSAJES QUE SE LE DA A LOS OBJETOS, UNIR COMO CORRESPONDE. A COMPLETAR