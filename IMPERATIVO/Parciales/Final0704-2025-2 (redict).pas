{Se desea analizar los exámenes finales de una cátedra.
De cada final se conoce:
- legajo del alumno
- nota (un real entre 0 y 100)
- fecha del examen
Un mismo alumno puede haber rendido más de un final.
Los exámenes a analizar son todos los que se tomaron entre 2011 y 2024, ambos inclusive.
Realice un programa que contenga:
a) Un módulo que lea exámenes, hasta leer un examen con legajo -1, y los almacene en una estructura eficiente para la búsqueda por nota.
b) Un módulo que reciba la estructura generada en a) y devuelva otra estructura con los exámenes cuya nota sea menor a un valor recibido por parámetro. Esta estructura debe estar agrupada por año y ordenada por legajo.
c) Un módulo que reciba la estructura generada en b) y devuelva la cantidad de exámenes que rindió un alumno cuyo legajo se recibe por parámetro.
}

program final07042025;

type

	rangoAnios = 2011..2024;

	fecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;
	
	examen = record
		legajo: integer;
		nota: real;
		fecha: fecha;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: examen;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: examen;
		sig: lista;
	end;
	
	vAnios = array [rangoAnios] of lista;
	
	procedure leerExamen (var e: examen);
	begin
		e.legajo:= Random(10000) - 1;
		if (e.legajo <> -1) then begin
			readln(e.nota);
			e.fecha.dia:= Random(28) + 1;
			e.fecha.mes:= Random(11) + 2;
			e.fecha.anio:= Random(14) + 2011;
		end;
	end;
	
	procedure agregarArbol (var a: arbol; e: examen);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= e;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (a^.dato.nota > e.nota) then
				agregarArbol (a^.HI, e)
			else
				agregarArbol (a^.HD, e);
		end;
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		e: examen;
	begin
		leerExamen(e);
		while (e.legajo <> -1) do begin
			agregarArbol(a,e);
			leerExamen(e);
		end;
	end;
	
	procedure inicializarVector (var v: vAnios);
	var
		i: integer;
	begin
		for i:= 2011 to 2024 do begin
			v[i]:= nil;
		end;
	end;

	procedure insertarOrdenado (var l: lista; e: examen);
	var
		ant, nue, act: lista;
	begin
		new(nue);
		nue^.dato:= e;
		act:= l;
		ant:= l;
		
		while (act <> nil) and (act^.dato.legajo < e.legajo) do begin
			ant:= act;
			act:= act^.sig;
		end;
		
		if (ant = act) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure generarVector (a: arbol; valor: real; var v: vAnios);
	begin
		if (a <> nil) then begin
			if (a^.dato.nota < valor) then begin
				insertarOrdenado(v[a^.dato.fecha.anio], a^.dato);
				generarVector(a^.HI, valor, v);
				generarVector(a^.HD, valor, v);
			end
			else
				generarVector(a^.HI, valor, v);
		end;
	end;
	
	function devolverCantLista (l: lista; valor: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.legajo = valor) then begin
				cant:= cant + 1;
			end;
			l:= l^.sig;
		end;
		devolverCantLista:= cant;
	end;
	
	function devolverCantExamenes (v: vAnios; legajo: integer): integer;
	var
		i, cant: integer;
	begin
		cant:= 0;
		for i:= 2011 to 2024 do begin
			cant:= cant + devolverCantLista(v[i], legajo);
		end;
		devolverCantExamenes:= cant;
	end;

var
	a: arbol;
	v: vAnios;
	valor: real;
	legajo: integer;
begin
	a:= nil;
	cargarArbol(a);
	inicializarVector(v);
	
	writeln('Ingrese un valor para cargar el vector con examenes con menor nota a ese valor: ');
	readln(valor);
	generarVector(a,valor,v);
	
	writeln('Ingrese un legajo a buscar en el sistema: ');
	readln(legajo);
	writeln('La cantidad de examenes del alumno con legajo ', legajo, ' es: ', devolvercantExamenes(v,legajo));
end.
