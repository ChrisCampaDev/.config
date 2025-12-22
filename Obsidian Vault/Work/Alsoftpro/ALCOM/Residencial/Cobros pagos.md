- En depositos digitales
La logica seria que existe pagos en fichero que vienen de diferentes formas:
1. fichero telebanca => Tomaria un estado de *registrado* => me devuelve un medio de pago con las facturas e importes con la factura que se pago
2. Fichero (cubacel)  
	1. Existente : Liquidada =>  Si los datos no son iguales => Intervencion
	2. no Existe : Preparada => hacer un cobrar con un medio de pago sin modificar para poner los datos como en 1. 
	3. Existe pero se anulo : mostrar como operacion anulada (un estado anulada)
3. Fichero banco => 
	1. Existe => lo deposito ( similar al paso 1. , puede ser viceversa cuando es una factura de telebanca )
	2. No existe => *Preparada* ( similar al pas 2. )
	3. 