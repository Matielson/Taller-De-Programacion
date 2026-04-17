{Un comercio desea generar una estructura con información de los productos vendidos a
partir de la información de ventas tiene en papel. Se pide:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se cargan código
de venta, código del producto vendido, cantidad de unidades vendidas y precio
unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el menor código de producto.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program ejercicio1practica4;

type

	producto = record
		codP: integer;
		cantUnid: integer;
		montoTotal: real;
	end;
	
	venta = record
		codV: integer;
		codP: integer;
		cantUnid: integer;
		precioUnid: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerVenta (var v: venta);
	begin
		readln(v.codV);
		if (v.codV <> 0) then begin
			readln(v.codP);
			readln(v.cantUnid);
			readln(v.precioUnid);
		end;
	end;
	
	procedure agregarArbol (var a: arbol; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codP:= v.codP;
			a^.dato.cantUnid:= v.cantUnid;
			a^.dato.montoTotal:= (v.cantUnid * v.precioUnid);
			a^.HI:=  nil;
			a^.HD:= nil;
		end
		else
			if (a^.dato.codP = v.codP) then begin
				a^.dato.cantUnid:= a^.dato.cantUnid + v.cantUnid;
				a^.dato.montoTotal:= a^.dato.montoTotal + (v.cantUnid * v.precioUnid);
			end
			else
				if (a^.dato.codP > v.codP) then
					agregarArbol (a^.HI, v)
				else
					agregarArbol (a^.HD, v);
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		v: venta;
	begin
		leerVenta(v);
		while (v.codV <> 0) do begin
			agregarArbol(a,v);
			leerVenta(v);
		end;
	end;
	
	procedure imprimirArbol (a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol (a^.HI);
			writeln('Codigo Producto: ', a^.dato.codP, 'Cantidad de unidades vendidas: ', a^.dato.cantUnid, 'Monto total: ', a^.dato.montoTotal);
			imprimirArbol (a^.HD);
		end;
	end;
	
	function retornarMenorCodigo (a: arbol): integer;
	begin
		if (a = nil) then begin
			retornarMenorCodigo:= -1;
		end
		else
			if (a^.HI = nil) then 
				retornarMenorCodigo:= a^.dato.codP
			else
				retornarMenorCodigo:= retornarMenorCodigo (a^.HI);
	end;
	
	function retornarCantMenoresA (a: arbol; valor: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantMenoresA:= 0;
		end
		else
			if (a^.dato.codP < valor) then
				retornarCantMenoresA:= 1 + retornarCantMenoresA(a^.HI, valor) + retornarCantMenoresA (a^.HD, valor)
			else
				retornarCantMenoresA:= retornarCantMenoresA(a^.HI, valor);
	end;
	
	function retornarMontoEntreDos (a: arbol; valor1: integer; valor2: integer): real;
	begin
		if (a = nil) then begin
			retornarMontoEntreDos:= 0;
		end
		else
			if (a^.dato.codP > valor1) and (a^.dato.codP < valor2) then
				retornarMontoEntreDos:= a^.dato.montoTotal + retornarMontoEntreDos(a^.HI, valor1, valor2) + retornarMontoEntreDos(a^.HD, valor1, valor2)
			else
				if (a^.dato.codP < valor1) then
					retornarMontoEntreDos (a^.HD, valor1, valor2)
				else
					retornarMontoEntreDos (a^.HI, valor1, valor2);
	end;

var
	a: arbol;
	valor, valor2: integer;
begin
	a:= nil;
	cargarArbol(a);
	imprimirArbol(a);
	
	writeln('El menor codigo de producto registrado es: ', retornarMenorCodigo(a));
	
	writeln('Ingrese un valor: ');
	readln(valor);
	writeln('La cantidad de los codigos de producto menores al valor ingresado son: ', retornarCantMenoresA(a,valor));
	
	writeln('Ingrese 2 valores: ');
	readln(valor);
	readln(valor2);
	writeln('El monto total entre los codigos de producto comprendidos en esos 2 valores es: ', retornarMontoEntreDos(a, valor, valor2));
end.
