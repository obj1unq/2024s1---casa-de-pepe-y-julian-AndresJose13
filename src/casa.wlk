object casaDePepeYJulian {

	var viveres = 50 % (1 * 100)
	var monto = 0

	method monto(_monto) {
		monto = _monto
	}

	method viveres(_viveres) {
		viveres = _viveres
	}

	method viveresSuficientes() {
		return viveres == 40 % (1 * 100)
	}

	method casaEnOrden() {
		return self.viveresSuficientes()
	}

//----------------------------------------------------------------------------------------------------------
}

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




//EJEMPLO
// var property precio = 50
// se utiliza como setter y getter

//VER OBJETO.MIN(0).ABS()