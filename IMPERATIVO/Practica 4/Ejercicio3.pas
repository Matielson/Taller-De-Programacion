program gorka;
type
	
	producto = record
		codProducto: integer;
		cantTotalUni: integer;
		montoTotal: real;
	end;
		
	venta = record
		codVenta: integer;
		codProdVendido: integer;
		cantUnidades: integer;
		precioUnitario: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerVenta(var v: venta);
	begin
		writeln('Ingrese el codigo de Venta: ');
		readln(v.codVenta);
		if (v.codVenta <> -1) then begin
			writeln('Ingrese el codigo de producto vendido: ');
			readln(v.codProdVendido);
			writeln('Ingrese la cantidad de unidades: ');
			readln(v.cantUnidades);
			writeln('Ingrese el precio del producto: ');
			readln(v.precioUnitario);
		end;
	end;
	
	procedure agregarArbol (var a: arbol; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codProducto:= v.codProdVendido;
			a^.dato.cantTotalUni:= v.cantUnidades;
			a^.dato.montoTotal:= v.precioUnitario;
		end
		else
			if (a^.dato.codProducto = v.codProdVendido) then begin
				a^.dato.cantTotalUni:= a^.dato.cantTotalUni + v.cantUnidades;
				a^.dato.montoTotal:= a^.dato.montoTotal + (v.cantUnidades * v.precioUnitario);
			end
			else
				if (v.codProdVendido < a^.dato.codProducto) then
					agregarArbol(a^.HI, v)
				else
					agregarArbol(a^.HD, v);
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		v: venta;
	begin
		leerVenta(v);
		while (v.codVenta <> -1) do begin
			agregarArbol(a,v);
			leerVenta(v);
		end;
	end;
	
	procedure imprimirNodoArbol(a: arbol);
	begin
		writeln('Codigo de Producto: ');
		write(a^.dato.codProducto);
		writeln('Cantidad Total de unidades: ');
		write(a^.dato.cantTotalUni);
		writeln('Monto Total: ');
		write(a^.dato.montoTotal);
	end;
	
	procedure imprimirArbolOrdenado (a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbolOrdenado(a^.HI);
			imprimirNodoArbol(a);
			imprimirArbolOrdenado(a^.HD);
		end;
	end;
	
	function devolverMaximo (a: arbol): integer;
	begin
		if (a^.HD = nil) then
			devolverMaximo:= a^.dato.codProducto
		else
			devolverMaximo:= devolverMaximo(a^.HD);
	end; 
	
	function devolverCantCods(a: arbol; valor: integer): integer;
	begin
		if (a = nil) then 
			devolverCantCods := 0
		else if (a^.dato.codProducto >= valor) then
				devolverCantCods := devolverCantCods(a^.HD,valor)
			else
				devolverCantCods := 1 + devolverCantCods(a^.HI,valor) + devolverCantCods(a^.hd,valor);
	end;
	
	function retornarMontoTotal(a:arbol; valor1:integer; valor2:integer):real;
	begin
		if (a = nil) then
			retornarMontoTotal := 0
		else if (a^.dato.codProducto > valor1) and (a^.dato.codProducto < valor2) then
				retornarMontoTotal := a^.dato.montoTotal + retornarMontoTotal(a^.HD,valor1,valor2) + retornarMontoTotal(a^.HI,valor1,valor2)
			else if (a^.dato.codProducto >= valor2) then
				retornarMontoTotal := retornarMontoTotal(a^.HI,valor1,valor2)
			else 
				retornarMontoTotal := retornarMontoTotal(a^.HD,valor1,valor2);
	end;
	
var
	nue: lista;
begin
	
	
	
end.
