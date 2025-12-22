program gork;
type
	
	dias = 1..7;
	
	alquiler = record
		dni: integer;
		num: integer;
		dia: dias;
	end;
	
	alquilerArbol = record
		dni: integer;
		num: integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: alquilerArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vAlquileres = array [dias] of arbol;
	
	procedure leerAlquiler(var a: alquiler);
	begin
		a.num := random(101);
		if (a.num <> 0) then begin
			a.dni := random(9000) + 1000;
			a.dia := random(7) + 1;
		end;
	end;
	
	procedure inicializarVector(var v: vAlquileres);
	var 
		i: dias;
	begin
		for i:= 1 to 7 do
			v[i] := nil;
	end;
	
	procedure insertarArbol (var ar: arbol; a: alquiler);
	var
		aN: alquilerArbol;
	begin
		if (ar = nil) then begin
			new(ar);
			aN.dni:= a.dni;
			aN.num:= a.num;
			ar^.dato:= aN;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (ar^.dato.num = a.num) then begin
				aN.dni:= a.dni;
				aN.num:= a.num;
				ar^.dato:= aN;
			end
			else
				if (a.num < ar^.dato.num) then insertarArbol(ar^.HI,a)
				else insertarArbol(ar^.HD,a);
	end;
	
	procedure generarVector (var v: vAlquileres);
	var
		a: alquiler;
	begin
		leerAlquiler(a);
		while (a.num <> 0) do begin
			insertarArbol(v[a.dia],a);
			leerAlquiler(a);
		end;
	end;
	
	function recorrerArbolyContar(ar: arbol; dni: integer): integer;
	begin
		if ar = nil then
			recorrerArbolyContar := 0
		else 
			if ar^.dato.dni = dni then recorrerArbolyContar := recorrerArbolyContar + 1;
			else recorrerArbolyContar := recorrerArbolyContar(ar^.HI, dni) + recorrerArbolyContar(ar^.HD, dni);
			
		end;
	end;
	
	function retornarAlquileres (v: vAlquileres; dni: integer): integer;
	var
		i: integer;
	begin
		retornarAlquileres:= 0;
		for i:= 1 to 7 do begin
			retornarAlquileres:= retornarAlquileres + recorrerArbolyContar(v[i],dni);
		end;
	end;
	
	function retornarCantArbol(ar: arbol ; dia,N1,N2: integer): integer;
	begin
		if ar = nil then begin
			retornarCantArbol := 0;
        end
        else
			retornarCantArbol := retornarCantArbol(ar^.HI, dia, N1, N2) + retornarCantArbol(ar^.HD, dia, N1, N2);
        if (ar^.num > N1) and (ar^.num < N2) then
            retornarCantArbol := retornarCantArbol + 1;
	end;
	
	function retornarEntreDos (v: vAlquileres; dia,N1,N2: integer): integer;
	var
		i: integer
	begin
		retornarEntreDos:= 0;
		for i:= 1 to 7 do begin
			retornarEntreDos:= retornarEntreDos + retornarCantArbol(v[i],dia,N1,N2);
		end;
	end;
	
var
	v: vAlquileres;
begin
	randomize;
	inicializarVector(v);
	generarVector(v);
end.
