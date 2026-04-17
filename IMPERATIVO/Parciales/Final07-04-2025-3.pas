{Se desea analizar los exámenes finales de una cátedra. De cada final se conoce: legajo del alumno, nota y fecha del examen. Un mismo alumno puede haber rendido más de un final. Los exámenes a analizar son todos los que se tomaron entre 2011 y 2024, ambos inclusive. Realice un programa que contenga:
a) Un módulo que lea finales (sin ningún orden preestablecido), hasta leer un examen con legajo -1, y los almacene en una estructura agrupada por año. En cada año los exámenes deben quedar ordenados por nota de manera descendente.
b) Un módulo que reciba la estructura generada en a) y devuelva otra estructura con los exámenes cuya nota sea mayor a un valor recibido por parámetro. Esta estructura debe ser eficiente para la búsqueda por legajo.
c) Un módulo que reciba la estructura generada en b) y devuelva la cantidad de exámenes que rindió un alumno cuyo legajo se recibe por parámetro.
}

program final07052025;

type

	rangoAnios = 2011..2024;

	fecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;

	examen = record
		legajo: integer;
		nota: integer;
		fecha: fecha;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: examen;
		sig: lista;
	end;
	
	vAnios = array [rangoAnios] of lista;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: examen;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerExamen (var e: examen);
	begin
		e.legajo:= Random(10000) - 1;
		if (e.legajo <> -1) then begin
			e.nota:= Random(10) + 1;
			e.fecha.dia:= Random(28) + 1;
			e.fecha.mes:= Random(11) + 2;
			e.fecha.anio:= Random(14) + 2011;
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
		while (act <> nil) and (act^.dato.nota > e.nota) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (ant = act) then begin
			l:= nue;
		end
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure cargarVector (var v: vAnios);
	var
		e: examen;
	begin
		leerExamen(e);
		while (e.legajo <> -1) do begin
			insertarOrdenado(v[e.fecha.anio], e);
			leerExamen(e);
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
			if (a^.dato.legajo > e.legajo) then
				agregarArbol(a^.HI, e)
			else
				agregarArbol(a^.HD, e);
		end;
	end;
	
	procedure recorrerAnioYAgregar (l: lista; valor: integer; var a: arbol);
	begin
		while (l <> nil) and (l^.dato.legajo > valor) do begin
			agregarArbol (a, l^.dato);
			l:= l^.sig;
		end;
	end;
	
	procedure generarArbol (v: vAnios; valor: integer; var a: arbol);
	var
		i: integer;
	begin
		for i:= 2011 to 2024 do begin
			recorrerAnioYAgregar(v[i], valor, a);
		end;
	end;
	
	function retornarCantExamenes (a: arbol; valor: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantExamenes:= 0;
		end
		else begin
			if (a^.dato.legajo = valor) then begin
				retornarCantExamenes:= 1 + retornarCantExamenes (a^.HI, valor) + retornarCantExamenes (a^.HD, valor);
			end
			else
				if (a^.dato.legajo > valor) then
					retornarCantExamenes:= retornarCantExamenes (a^.HI, valor)
				else
					retornarCantExamenes:= retornarCantExamenes (a^.HD, valor);
		end;
	end;

var
	v: vAnios;
	a: arbol;
	valor: integer;
begin
	inicializarVector(v);
	cargarVector(v);
	
	writeln('Ingrese un valor para generar la nueva estructura: ');
	readln(valor);
	a:= nil;
	generarArbol(v,valor,a);
	writeln('Una nueva estructura fue generada con examenes con nota mayor al valor ingresado.');
	
	writeln('Ingrese un legajo a buscar en el sistema: ');
	readln(valor);
	writeln('La cantidad de examenes finales rendidos registrados para ese legajo es: ', retornarCantExamenes(a,valor));
end.
