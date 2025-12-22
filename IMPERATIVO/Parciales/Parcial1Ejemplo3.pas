program gork; 

type

	materiales = 1..8;

	artesania = record
		num: integer;
		dni: integer;
		codM: materiales;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dni: integer;
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;
	
	vMateriales = array [materiales] of integer;

	procedure leerArtesania (var a: artesania);
	begin
		a.dni := Random(10000);
		if (a.dni <> 0) then begin
			a.num := Random(100) + 2000;
			a.codM := Random(8) + 1;
		end;
	end;
	
	procedure insertarArbol(var ar: arbol; a: artesania);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dni:= a.dni;
			ar^.dato:= 1;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (ar^.dni = a.dni) then begin
				ar^.dato:= ar^.dato + 1;
			end
			else
				if (a.dni < ar^.dni) then insertarArbol(ar^.HI,a)
				else insertarArbol(ar^.HD,a);
	end;
	
	procedure inicializarVector(var v: vMateriales);
	var
		i: integer;
	begin
		for i:= 1 to 8 do begin
			v[i]:= 0;
		end;
	end;
	
	procedure generarArbolYVector (var ar: arbol; var v: vMateriales);
	var
		a: artesania;
	begin
		leerArtesania(a);
		while (a.dni <> 0) do begin
			insertarArbol(ar,a);
			v[a.codM]:= v[a.codM] + 1;
			leerArtesania(a);
		end;
	end;
	
	function retornarCantArtesanos (ar: arbol; dni: integer): integer;
	begin
		if (ar = nil) then begin
			retornarCantArtesanos:= 0;
			writeln('No se encontro el DNI solicitado o el sistema esta vacio.');
		end
		else
			if (ar^.dni < dni) then retornarCantArtesanos := 1 + retornarCantArtesanos(ar^.HI, dni) + retornarCantArtesanos(ar^.HD, dni)
			else retornarCantArtesanos := retornarCantArtesanos(ar^.HI, dni) + retornarCantArtesanos(ar^.HD, dni);
	end;
	
	procedure insercion (var v: vMateriales; dimL: integer);
	var
	i,j: integer;
	actual: integer;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i-1;
			while (j > 0) and (v[j] > actual) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	
var
	ar: arbol;
	v: vMateriales;
	dni, dimL: integer;
begin
	ar:= nil;
	dimL:= 8;
	inicializarVector(v);
	generarArbolYVector(ar,v);
	readln(dni);
	writeln(retornarCantArtesanos(ar,dni));
	insercion(v,dimL);
end.
