program ejercicio2practica3;

type
	
	venta = record
		codP: integer;
		fecha: integer;
		cantVendidas: integer;
	end;
	
	producto = record
		codP: integer;
		cant: integer;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: venta;
		sig: lista;
	end;
	
	producto2 = record
		codP: integer;
		listaVentas: lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record
		dato: producto;
		HI: arbol2;
		HD: arbol2;
	end;
	
	arbol3 = ^nodoArbol3;
	
	nodoArbol3 = record
		dato: producto2;
		HI: arbol3;
		HD: arbol3;
	end;
	
	procedure leerVenta (var v: venta);
	begin
		v.codP:= Random(101);
		if (v.codP <> 0) then begin
			v.fecha:= Random(31) + 1;
			v.cantVendidas:= Random(1000) + 1;
		end;
	end;
	
	procedure agregarArbol (var a: arbol; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= v;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (v.codP < a^.dato.codP) then begin
				agregarArbol(a^.HI,v);
			end
			else
				agregarArbol(a^.HD,v);
		end;
	end;
	
	procedure agregarArbol2 (var a2: arbol2; p: producto);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato:= p;
			a2^.HI:= nil;
			a2^.HD:= nil;
		end
		else begin
			if (p.codP = a2^.dato.codP) then begin
				a2^.dato.cant:= a2^.dato.cant + p.cant;
			end
			else
				if (p.codP < a2^.dato.codP) then
					agregarArbol2(a2^.HI, p)
				else
					agregarArbol2(a2^.HD, p);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; v: venta);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= v;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol3 (var a3: arbol3; v: venta);
	begin
		if (a3 = nil) then begin
			new(a3);
			a3^.dato.codP:= v.codP;
			a3^.dato.listaVentas:= nil;
			agregarAdelante(a3^.dato.listaVentas, v);
			a3^.HI:= nil;
			a3^.HD:= nil;
		end
		else begin
			if (a3^.dato.codP = v.codP) then begin
				agregarAdelante(a3^.dato.listaVentas,v);
			end
			else
				if (v.codP < a3^.dato.codP) then
					agregarArbol3 (a3^.HI, v)
				else
					agregarArbol3 (a3^.HD, v);
		end;
	end;
	
	procedure cargarArboles (var a: arbol; var a2: arbol2; var a3: arbol3);
	var
		v: venta;
		p: producto;
	begin
		leerVenta(v);
		while (v.codP <> 0) do begin
			agregarArbol(a,v);
			p.codP:= v.codP;
			p.cant:= v.cantVendidas;
			agregarArbol2(a2,p);
			agregarArbol3(a3, v);
			leerVenta(v);
		end;
	end;
	
	function retornarCantProductos (a: arbol; fecha: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantProductos:= 0;
		end
		else begin
			if (a^.dato.fecha = fecha) then begin
				retornarCantProductos:= a^.dato.cantVendidas + retornarCantProductos (a^.HI, fecha) + retornarCantProductos (a^.HD, fecha); 
			end
			else
				retornarCantProductos:= retornarCantProductos (a^.HI, fecha) + retornarCantProductos (a^.HD, fecha);
		end;
	end;
	
	procedure maxCodigo (a: arbol2; var max: integer; var maxCod: integer);
	begin
		if (a <> nil) then begin
			maxCodigo (a^.HI, max, maxCod);
			if (a^.dato.cant > max) then begin
				max:= a^.dato.cant;
				maxCod:= a^.dato.codP;
			end;
			maxCodigo (a^.HD, max, maxCod);
		end;
	end;
	
	function retornarCantLista (l: lista): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		retornarCantLista:= cant;
	end;	
	
	procedure maxCodigo2 (a: arbol3; var max: integer; var maxCod: integer);
	var
		aux: integer;
	begin
		if (a <> nil) then begin
			aux:= retornarCantLista(a^.dato.listaVentas);
			if (aux > max) then begin
				max:= aux;
				maxCod:= a^.dato.codP;
			end;
			maxCodigo2 (a^.HI, max, maxCod);
			maxCodigo2 (a^.HD, max, maxCod);
		end;
	end;
	
var
	a: arbol;
	a2: arbol2;
	a3: arbol3;
	fechaABuscar: integer;
	max, maxCod: integer;
begin
	a:= nil;
	a2:= nil;
	a3:= nil;
	
	/// INCISO A
	
	cargarArboles(a,a2,a3);
	
	/// INCISO B 
	
	writeln('Ingrese una fecha para buscar sus productos en el sistema: ');
	readln(fechaABuscar);
	writeln('La cantidad de productos para la fecha ingresada es: ', retornarCantProductos(a,fechaABuscar));
	
	/// INCISO C
	
	max:= -1;
	maxCod:= -1;
	maxCodigo(a2, max, maxCod);
	writeln('El codigo de producto con mayor cantidad de unidades vendidas es: ', maxCod);
	
	/// INCISO D
	
	max:= -1;
	maxCod:= -1;
	maxCodigo2(a3, max, maxCod);
	writeln('El codigo de producto con mayor cantidad de ventas es: ', maxCod);
end.
