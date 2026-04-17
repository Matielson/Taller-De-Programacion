program ejercicio1Practica1;

const
	dimF = 50;
type
	dias = 0..31;
	codigos = 1..15;
	rangoVentas = 1..99;

	venta = record
		diaVenta: dias;
		codP: codigos;
		cantVendidas: rangoVentas;
	end;
	
	vVentas = array [1..50] of venta;
	
	ventaLista = record
		codP: codigos;
		cant: integer;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: ventaLista;
		sig: lista;
	end;
		
	
	/// INCISO A
	
	procedure leerVenta (var v: venta);
	begin
		v.diaVenta:= Random(32);
		if (v.diaVenta <> 0) then begin
			v.codP:= Random(15)+1;
			readln(v.cantVendidas);
		end;
	end;
	
	procedure cargarVector (var v: vVentas; var dimL: integer);
	var
		ven: venta;
	begin
		dimL:= 0;
		leerVenta(ven);
		while (dimL < dimF) and (ven.diaVenta <> 0) do begin
			dimL:= dimL + 1;
			v[dimL]:= ven;
			leerVenta(ven);
		end;
	end;
	
	/// INCISO B y D y F
	
	procedure imprimirVector (v: vVentas; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln(v[i].diaVenta, v[i].codP, v[i].cantVendidas);
		end;
	end;
	
	/// INCISO C
	
	procedure ordenarVectorSeleccion (var v: vVentas; dimL: integer);
	var
		i,j: integer;
		item: venta;
		pos: integer;
	begin
		for i:= 1 to dimL-1 do begin
			pos:= i;
			for j:= i+1 to dimL do begin
				if (v[j].codP < v[pos].codP) then 
					pos:= j;
			end;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;		
		end;
	end;
	
	
	/// INCISO E
	
	procedure eliminarEntreDos (var v: vVentas; var dimL: integer; cod1, cod2: integer);
	var
		i, j: integer;
	begin
		i:= 1;
		while (i <= dimL) and (v[i].codP < cod1) do
			i:= i + 1;

		j:= i;
		while (j <= dimL) and (v[j].codP <= cod2) do
			j:= j + 1;

		while (j <= dimL) do begin
			v[i]:= v[j];
			i:= i + 1;
			j:= j + 1;
		end;

		dimL:= i - 1;
	end;
	
	/// INCISO G
	
	procedure agregarAdelante (var l: lista; v: ventaLista);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= v;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure retornarInfo (var l: lista; v: vVentas; dimL: integer);
	var
		i: integer;
		actual: integer;
		cantTotal: integer;
		vL: ventaLista;
	begin
		i:= 1;
		while (i <= dimL) do begin
			if (v[i].codP MOD 2 = 0) then begin
				cantTotal:= 0;
				actual:= v[i].codP;
				while (i <= dimL) and (v[i].codP = actual) do begin
					cantTotal:= cantTotal + v[i].cantVendidas;
					i:= i + 1;
				end;
				vL.codP:= actual;
				vL.cant:= cantTotal;
				agregarAdelante(l, vL);
			end
			else
				i:= i + 1;
		end;
	end;
	
	/// INCISO H
	
	procedure imprimirLista (l: lista);
	begin
		while (l <> nil) do begin
			writeln('El codigo de producto', l^.dato.codP, ' tiene una cantidad de: ', l^.dato.cant);
			l:= l^.sig;
		end;
	end;
	
var
	l: lista;
	v: vVentas;
	dimL, cod1, cod2: integer;
begin
	dimL:= 0;
	l:= nil;
	cargarVector(v,dimL);
	imprimirVector(v,dimL);
	ordenarVectorSeleccion(v,dimL);
	imprimirVector(v,dimL);
	writeln('Ingrese 2 codigos: ');
	readln(cod1);
	readln(cod2);
	eliminarEntreDos(v,dimL,cod1,cod2);
	retornarInfo(l,v,dimL);
end.

