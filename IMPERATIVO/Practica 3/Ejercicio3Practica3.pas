program gork;

const

type
	
	final = record
		legajo: integer;
		codM: integer;
		fecha: string;
		nota: real;
	end;
	
	finalNuevo = record
		codM: integer;
		fecha: string;
		nota: real;
	end;
	
	lista = ^nodoLista
	
	nodoLista = record
		dato: final;
		sig: lista;
	end;
	
	alumno = record
		legajo: integer;
		finales: lista;
	end;
	
	arbol = ^nodoArbol
	
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerFinal (var f: final);
	begin
		readln(f.legajo);
		readln(f.codM);
		readln(f.fecha);
		readln(f.nota);
	end;
	
	procedure agregarFinal (var l: lista; f: final);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= f;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure procesarAlumnos
	
	
	
	
	
	
	
	
	
var

begin

end.
