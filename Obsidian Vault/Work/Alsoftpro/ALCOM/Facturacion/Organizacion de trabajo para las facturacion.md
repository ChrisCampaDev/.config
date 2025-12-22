Backend encargado : Ernesto y Victor
# Tarea de la 1ra semana : 20 horas

Las horas de trabajo estimadas seria la cantidad de horas que debe ser usadas para llegar a la solucion y dejar las tarjetas en *Ready to Test* para comprobar el codigo y testear.
Todas las dudas y negociaciones entre front y back deberan ser a traves del chat de tarjetas del Huly 
Cualquier duda que se tenga con respecto a los componentes, modelos, funcionalidades y diseno de pantallas se deben de comunicar con *David* (Backend) o *Christian* (Frontend)
## Listado de Tarifas 

**Horas de trabajo estimadas** : 8 horas

Endpoint: GET: /d_tarifa/formato=3

Al llamarse al endpoint el frontend recibira un JSON con datos que debera mostrar en la tabla en dependencia de las columnas. En Alcom, los atributos de los json que terminan en  <d_fk_detalle__nombre> son los strings que se muestran en las columnas de las tablas

Los botones con iconos de las tablas (Botones de accion) se muestran en dependencia de los can_can (los can_can son valores booleanos que definen los permisos que posee un usuario o no en una pantalla determinada)

- Accion de los botones:
 1. Boton de duplicar: Se le enviara los datos en formato json de las tarifas seleccionada(s) al backend con un metodo post
  2. Boton Adicionar : El boton adicionar levantara una pantalla que mostrara un formulario con los campos a rellenar por el usuario. Pueden existir campos obligatorios que seran resaltados con un *asterisco*.  
  3. Boton de Historicos: Este boton carga las facturas que han sido canceladas/desactivadas y las muetra en la tabla. Al cambiar para estos datos, el Tooltip del boton pasa de **historico** a **activos** 
  4. Boton Visualizar: Misma accion que el boton de Adicionar pero las entradas de datos (inputs) estaran deshabilitadas
  5. Boton Editar: Misma accionque el boton Adicionar pero las entradas de datos tendran los valores de los atributos de la factura y permitira editar los campos necesarios (En caso de que algunos no sean editables)
  6. Boton de Activar/Desactivar: Estos botones cambian en dependencia de que se muestra en pantalla. si se muestran las facturas activas el icono a mostrar sera el indicado para *Desactivar* una factura, en caso contrario seria el de *Activar* 
  7. Boton de Listar: Boton encargado de refrescar los datos de la tabla
## Activar y Desactivar Facturas

**Horas de trabajo estimadas** : 4 horas

El boton de Desactivar/Activar facturas permite cambiar el atributo de la factura: activo a el valor opuesto que tiene
Endpoints:
_PUT /d_tarifa/cancel/ {ids}_

_PUT /d_tarifa/activate/ {ids}_

Las facturas en ALCOM nunca se eliminan por completo, solo cambian de estado a *Activa* o *Cancelada*

Antes de cada accion debes mostrar un mensaje para confirmar que el usuario esta seguro de realizar esta accion. 

### Agregar Factura 

**Hora de trabajo estimadas:** 8 horas
Endpoint: _POST /d_tarifa/_

En la pantalla del formulario se rellenaran los datos necesarios y se enviara un JSON al backend para que este almacene los datos en la tabla.
1. Caso con Errores:
	1. Si el backend detecta algun error, se mostrara en rojo el input (entrada de dato) que tiene un error y el mensaje correspondiente enviado por el backend. Se dejara al usuario volver a introducir datos de manera correcta sin perder los datos ya escritos
2. Caso sin Errores:
	1. Todo bien:
		1. Se mostrara un mensaje en forma de Toast que dara a entender al usuario que los datos se agregaron de manera correcta. 
		2. Se limpiara los inputs dejando todo vacio y se mantendra en la pantalla hasta que el usuario decida cerrarla por el mismo. A la hora de cerrar mostrar un mensaje de confirmacion
		3.  Al cerrar la pantalla se refrescara los datos de manera automatica. actualizando asi la tabla

- Pantalla ADICIONAR: 
	Pantalla de Ejemplo: Adicionar Caja ventanilla
	- Hablar con el Backend para saber que datos son necesarios y deben ser enviados
	- Algunos datos pueden que vengan de la caja del usuario
### Pull Requests
- Los pull request (PR) seran asignados para que Christian (caso en el frontend) y David (caso del backend) los revisen
- (En el caso del Frontend) Antes de que se actualice la rama dev. Antes de subir cualquier commit, correr en la terminal el comando:  
	``` bash
		yarn build
	```
- Esto seria para comprobar todas las reglas del eslint y que se verifique que todo esta funcionando correctamente. 
	
	

