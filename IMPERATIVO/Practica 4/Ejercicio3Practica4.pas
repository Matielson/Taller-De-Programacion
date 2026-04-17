program ejercicio3practica4;

type

	producto = record
		cod: integer;
		cantUnid: integer;
		montoTotal: real;
	end;
	
	venta = record
		cod: integer;
		codP: integer;
		cantUnid: integer;
		precio: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerVenta (var v: venta);
	begin
		writeln('Ingrese el codigo de venta: ');
		readln(v.cod);
		if (v.cod <> -1) then begin
			writeln('Ingrese el codigo del producto vendido: ');
			readln(v.codP);
			writeln('Ingrese la cantidad de unidades vendidas: ');
			readln(v.cantUnid);
			writeln('Ingrese el precio unitario del producto: ');
			readln(v.precio);
		end;
	end;
	
	procedure agregarArbol (var a: arbol; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.cod:= v.codP;
			a^.dato.cantUnid:= v.cantUnid;
			a^.dato.montoTotal:= (v.precio * v.cantUnid);
		end
		else
			if (a^.dato.cod = v.codP) then begin
				a^.dato.cantUnid:= a^.dato.cantUnid + v.cantUnid;
				a^.dato.montoTotal:= a^.dato.montoTotal + (v.cantUnid * v.precio);
			end
			else
				if (a^.dato.cod < v.codP) then 
					agregarArbol (a^.HI, v)
				else
					agregarArbol (a^.HD, v);				      
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		v: venta;
	begin
		leerVenta(v);
		while (v.cod <> -1) do begin
			agregarArbol (a,v);
			leerVenta(v);
		end;
	end;
	
	procedure imprimirArbol (a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol (a^.HI);
			writeln('Codigo Producto: ', a^.dato.cod, ' Cantidad de unidades: ', a^.dato.cantUnid, ' Monto Total Vendido: ', a^.dato.montoTotal);
			imprimirArbol (a^.HD);
		end;
	end;
	
	function retornarMaxCod (a: arbol): integer;
	begin
		if (a = nil) then begin
			retornarMaxCod:= -1;
		end
		else
			if (a^.HD = nil) then
				retornarMaxCod:= a^.dato.cod
			else
				retornarMaxCod:= retornarMaxCod(a^.HD);
	end;
	
	function retornarMenorValor (a: arbol; valor: integer): integer;
	begin
		if (a = nil) then begin
			retornarMenorValor:= 0;
		end
		else
			if (a^.dato.cod < valor) then begin
				retornarMenorValor:= 1 + retornarMenorValor (a^.HI, valor) + retornarMenorValor (a^.HD, valor);
			end
			else
				retornarMenorValor:= retornarMenorValor (a^.HI, valor);
	end;
	
	function retornarMontoEntreDos (a: arbol; valor1: integer; valor2: integer): real;
	begin
		if (a = nil) then begin
			retornarMontoEntreDos:= 0;
		end
		else
			if (a^.dato.cod > valor1) and (a^.dato.cod < valor2) then begin
				retornarMontoEntreDos:= a^.dato.montoTotal + retornarMontoEntreDos (a^.HI, valor1, valor2) + retornarMontoEntreDos (a^.HD, valor1, valor2);
			end
			else
				if (a^.dato.cod <= valor1) then begin
					retornarMontoEntreDos:= retornarMontoEntreDos (a^.HD, valor1, valor2);
				end
				else
					retornarMontoEntreDos:= retornarMontoEntreDos (a^.HI, valor1, valor2);
	end;

var
	a: arbol;
	valor, valor2: integer;
begin
	a:= nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln(retornarMaxCod(a));
	readln(valor);
	writeln(retornarMenorValor(a,valor));
	
	readln(valor);
	readln(valor2);
	writeln(retornarMontoEntreDos(a,valor,valor2));
end.
