#### Tipos de datos en Go
 - int, int8, int16, int32, int64 | valor entero | valor por defecto: 0
 - uint, uint8, uint16, uint32, uint64 | valor entero sin signo | valor por defecto: 0
 - float32, float64 | valor decimal | valor por defecto: 0.0
 - complex64, complex128 | valor complejo | valor por defecto: (0+0i)
 - bool |  valor por defecto: false
 - string | valor por defecto: ""
 - byte(uint8) |valor por defecto: 0
 - rune(int32) |valor por defecto: 0
 - error |valor por defecto: nil

#### Arreglos fijos y dinamicos
- Los **arreglos** en Go deben tener una capacidad definida. 
- Tambien existen los **slices**, arreglos dinamicos que pueden crecer o disminuir 
- Los **mapas** son diccionarios donde se le asigna una llave(key) a un valor para acceder mas rapido a dicho valor.

``` go 
	
	//Arrays y slices
	//Arrays | arreglos fijos que deben tener un tamaño fijo y deben ser del mismo tipo de dato
	var numeros [5]int = [5]int{1, 2, 3, 4, 5}
	fmt.Println(numeros)

	//Slices | arreglos dinamicos que pueden crecer o decrecer en tamaño y pueden ser de diferentes tipos de datos
	var nombres []string = []string{"Juan", "Pedro", "Maria"}
	fmt.Println(nombres)

	fmt.Println(len(nombres)) // elementos en el arreglo
	fmt.Println(cap(nombres)) // capacidad del arreglo
	
	//Mapas => como los diccionarios en javasctipt | map[key]value
	var personas map[string]string = map[string]string{
		"Juan":  "juan@example.com",
		"Pedro": "pedro@example.com",
		"Maria": "maria@example.com",
	}

	
	```