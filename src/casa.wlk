
object casaDePepeYJulian {
	var viveres = 50%(1*100)
	var monto = 0
	
	method monto(_monto){
		monto = _monto
	}
	method viveres(_viveres){
		viveres = _viveres
	}
	
	method viveresSuficientes(){
		return viveres == 40%(1*100)
	}
	
	method casaEnOrden(){
		return self.viveresSuficientes() 
	}



//----------------------------------------------------------------------------------------------------------
	


}


object cuentaCorriente{
	var saldo = 0
	
	method extraer(cantidad){
		 saldo = saldo - cantidad
	}

	method depositar(cantidad){
		saldo = saldo + cantidad
	}
	method saldo(){
		return saldo
	}
	method saldo(_saldo){
		saldo = _saldo
	}
}



object cuentaConGastos{
	var saldo = 0
	var gastoPorOperacion = 0
	
	method extraer(cantidad){
		 saldo = saldo - cantidad - self.gastoPorOperacion()
	}
	method depositar(cantidad){
		saldo = saldo + cantidad - self.gastoPorOperacion()
	}
	method gastoPorOperacion(){
		return gastoPorOperacion
	}
	method gastoPorOperacion(_gastoPorOperacion){
		gastoPorOperacion = _gastoPorOperacion
	}
	method saldo(){
		return saldo
	}
	
	
	
}

object combinada{
	
	method saldoTotal(cuenta){
		return cuenta.saldo() + cuenta.saldo()
	}
	method cuentaPrimaria(cuenta){
		return cuenta.cuentaPrimaria()
	}
	method cuentaSecundaria(cuenta){
		return cuenta.cuentaSecundaria()
	}
	
	method extraer(cuenta, cantidad){
		return cuenta.extraer(cantidad)
	}
	method extraerDeCuentas(cantidad, cuenta){
		return if (cantidad < cuenta.cuentaPrimaria()) self.extraer(cuenta, cantidad)
			   else self.extraer(cuenta, cantidad)
	}
	
}

