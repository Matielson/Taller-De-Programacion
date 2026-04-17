{Se desea procesar las ventas de una ferretería. De cada venta se conoce: CUIL del cliente, monto de la compra y fecha de la compra. Un cliente puede hacer más de una compra, incluso en el mismo día. Realice un programa que contenga:
a) Un módulo que lea ventas, hasta leer una venta con CUIL -1, y las almacene en una estructura agrupada por mes. En cada mes las ventas deben quedar ordenadas por CUIL y debe ser eficiente para la búsqueda.
b) Un módulo que reciba la estructura generada en a) y devuelva otra estructura con las ventas cuyo monto de compra sea mayor a un valor recibido por parámetro. Esta estructura debe ser eficiente para la búsqueda por año.
c) Un módulo que reciba la estructura generada en b) y devuelva la cantidad de ventas por mes realizadas en un rango de años recibidos por parámetro.
}

program parcial30062025;

type

	fecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;

	venta = record
		cuil: integer;
		monto: real;
		fecha: fecha;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
	vMeses = array [1..12] of arbol;
	
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		dato: venta;
		HI: arbol2;
		HD: arbol2;
	end;
	
	procedure leerVenta (var v: venta);
	begin
		readln(v.cuil);
		if (v.cuil <> -1) then begin
			readln(v.monto);
			v.fecha.dia:= Random(31) + 1;
			v.fecha.mes:= Random(12) + 1;
			v.fecha.anio:= Random(27) + 2000;
		end;
	end;
	
	procedure inicializarVector (var v: vMeses);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			v[i]:= nil;
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
			if (a^.dato.cuil > v.cuil) then
				agregarArbol (a^.HI, v)
			else
				agregarArbol (a^.HD, v);
		end;
	end;
	
	procedure cargarVector (var v: vMeses);
	var
		ven: venta;
	begin
		leerVenta(ven);
		while (ven.cuil <> -1) do begin
			agregarArbol(v[ven.fecha.mes], ven);
			leerVenta(ven);
		end;
	end;
	
	procedure agregarArbol2 (var a: arbol2; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= v;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.dato.fecha.anio > v.fecha.anio) then
				agregarArbol2 (a^.HI, v)
			else
				agregarArbol2 (a^.HD, v);
	end;
	
	procedure recorrerArbolYAgregar (a1: arbol; var a2: arbol2; valor: real);
	begin
		if (a1 <> nil) then begin
			recorrerArbolYAgregar(a1^.HI, a2, valor);
			if (a1^.dato.monto > valor) then begin
				agregarArbol2 (a2, a1^.dato);
			end;
			recorrerArbolYAgregar(a1^.HD, a2, valor);
		end;
	end;
	
	procedure cargarArbol2 (v: vMeses; valor: real; var a: arbol2);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			recorrerArbolYAgregar (v[i], a, valor);
		end;
	end;
	
	function devolverCantVentas (a: arbol2; valor1: integer; valor2: integer): real;
	begin
		if (a = nil) then begin
			devolverCantVentas:= 0;
		end
		else begin
			if (a^.dato.fecha.anio >= valor1) and (a^.dato.fecha.anio <= valor2) then begin
				devolverCantVentas:= a^.dato.monto + devolverCantVentas(a^.HI, valor1, valor2) + devolverCantVentas(a^.HD, valor1, valor2);
			end
			else
				if (a^.dato.fecha.anio > valor1) then
					devolverCantVentas:= devolverCantVentas (a^.HD, valor1, valor2);
				else
					devolverCantVentas:= devolverCantVentas (a^.HI, valor2, valor2) + devolverCantVentas (a^.HD, valor1, valor2);
		end;
	end;

var

begin

end.
