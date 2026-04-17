program ejercicio4Practica1;
type
	rangoRubros = 1..6;

	producto = record
		codP: integer;
		codR: rangoRubros;
		precio: real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: producto;
		sig: lista;
	end;
	
	vRubros = array [rangoRubros] of lista;
	
	vProductos = array [1..20] of producto;
	
	procedure leerProducto (var p: producto);
	begin
		readln(p.precio);
		if (p.precio <> -1) then begin
			p.codP:= Random(100) + 1;
			p.codR:= Random(6) + 1;
		end;
	end;
	
	procedure insertarOrdenado (var l: lista; p: producto);
	var
		ant, act, nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= nil;
		if (l = nil) then begin
			l:= nue;
		end
		else begin
			ant:= l;
			act:= l;
			while (act <> nil) and (act^.dato.codP < nue^.dato.codP) do begin
				ant:= act;
				act:= act^.sig;
			end;
			if (act = l) then begin
				nue^.sig:= l;
				l:= nue;
			end
			else begin
				ant^.sig:= nue;
				nue^.sig:= act;
			end;
		end;
	end;
	
	procedure cargarVector (var v: vRubros);
	var
		p: producto;
		i: integer;
	begin
		for i:= 1 to 6 do begin
			leerProducto(p);
			insertarOrdenado(v[i], p);
		end;
	end;
	
	procedure imprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.codP);
		end;
	end;
		
	procedure imprimirCodigosPorRubro (v: vRubros);
	var
		i: integer;
	begin
		for i:= 1 to 6 do begin
			writeln('Codigos de producto del rubro: ', i);
			imprimirLista(v[i]);
		end;
	end;
	
	procedure cargarVectorNuevo (var vP: vProductos; vR: vRubros; var dimL: integer);
	var
		l3: lista;
	begin
		l3:= vR[3];
		dimL:= 1;
		while (l3 <> nil) and (dimL < 20) do begin
			vP[dimL]:= l3^.dato;
			dimL:= dimL + 1;
			l3:= l3^.sig;
		end;
	end;
	
	procedure ordenarVectorSeleccion (var vP: vProductos; dimL: integer);
	var
		i,j,pos: integer;
		item: producto;
	begin
		for i:= 1 to dimL-1 do begin
			pos:= i;
			for j:= i+1 to dimL do begin
				if (vP[j].precio < vP[pos].precio) then pos:= j;
			end;
			item:= vP[pos];
			vP[pos]:= vP[i];
			vP[i]:= item;
		end;
	end;
	
	procedure imprimirVector (vP: vProductos);
	var
		i: integer;
	begin
		for i:= 1 to 20 do begin
			writeln('Precio ', i, ': ', vP[i].precio);
		end;
	end;
	
	function calcularPromedioPrecios (v: vProductos): real;
	var
		precioTotal: real;
		i: integer;
	begin
		precioTotal:= 0;
		for i:= 1 to 20 do begin
			precioTotal:= precioTotal + v[i].precio;
		end;
		calcularPromedioPrecios:= precioTotal / 20;
	end;

var
	vR: vRubros;
	vP: vProductos;
	dimL: integer;
begin
	cargarVector(vR);
	imprimirCodigosPorRubro(vR);
	cargarVectorNuevo(vP, vR, dimL);
	ordenarVectorSeleccion(vP, dimL);
	imprimirVector(vP);
	writeln('Promedio de los 20 precios del rubro 3: ', calcularPromedioPrecios(vP));
end.
