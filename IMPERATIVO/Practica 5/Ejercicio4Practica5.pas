program gork;
const
dimL = 7;
type generos = 1..7;
	
	libro = record
		isbn: integer;
		codA: integer;
		codG: generos;
	end;
	
	libroNuevo = record
		
	
	arbol = ^nodoArbol
	
	nodoArbol = record
		codA: integer;
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;
	
	vGeneros = array [generos]
		
	procedure leerLibro (var l : libro);
	begin
		l.isbn := Random(1000);
		if (l.isbn <> 0) then begin
			l.codA := Random(300) + 100;
			l.codG := Random(7) + 1;
		end;
	end;
	
	procedure inicializarVector (var v: vGeneros);
	var
		i: integer;
	begin
		for i:= 1 to 7 do begin
			v[i]:= 0;
		end;
	end;
	
	procedure insertarArbolyVector(var ar: arbol, var v: vGeneros,l: libro);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.codA:= l.codA;
			v[l.codG]:= v[l.codG] + 1;
			ar^.dato:= ar^.dato + 1;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else begin
			if (ar^.codA = l.codA) then begin
				v[l.codG]:= v[l.codG] + 1;
				ar^.dato:= ar^.dato + 1;
			end
			else begin
				if (l.codA < ar^.codA) then insertarArbolyVector(ar^.HI,v,l);
				else insertarArbolyVector(ar^.HD,v,l);
			end;
		end;
	end;
	
	procedure generarArbolyVector (var ar: arbol, var v: vGeneros);
	var
		l: libro;
	begin
		leerLibro(l);
		while (l.isbn <> 0) do begin
			insertarArbolyVector(ar,v,l);
			leerLibro(l);
		end;
	end;
	
	procedure ordenarInsercion (var v: vGeneros; dimL: integer);
	var
	i, j: integer; 
	actual: integer;
	begin
		for i:= 2 to dimLog do begin
			actual:= v[i];
			j:= i-1;
			while (j > 0) and (v[j] < actual) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	
	
	
	
var
	v: vGeneros;
	ar: arbol;
	l: libro;
begin
	inicializarVector(v);
	generarArbolyVector(ar,v);
	ordenarInsercion(v,dimL);
end
