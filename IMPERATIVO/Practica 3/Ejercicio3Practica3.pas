{a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado}

program ejercicio3practica3;

type

	alumno = record
		legajo: integer;
		codM: integer;
		fecha: string;
		nota: real;
	end;
	
	fin = record
		codM: integer;
		fecha: string;
		nota: real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: fin;
		sig: lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: alumno;
		lista: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	regLista = record
		legajo: integer;
		promedio: real;
	end;
	
	lista2 = ^nodoLista2;
	
	nodoLista2 = record
		dato: regLista; 
		sig: lista2;
	end;
	
	procedure leerAlumno (var a: alumno);
	begin
		readln(a.legajo);
		if (a.legajo <> 0) then begin
			readln(a.codM);
			readln(a.fecha);
			readln(a.nota);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; a: alumno);
	var
		nue: lista;
		f: fin;
	begin
		new(nue);
		f.codM:= a.codM;
		f.fecha:= a.fecha;
		f.nota:= a.nota;
		nue^.dato:= f;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol (var ar: arbol; a: alumno);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dato:= a;
			ar^.lista:= nil;
			agregarAdelante(ar^.lista, a);
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else begin
			if (a.legajo = ar^.dato.legajo) then begin
				agregarAdelante(ar^.lista, a);
			end
			else
				if (a.legajo < ar^.dato.legajo) then begin
					agregarArbol(ar^.HI, a);
				end
				else
					agregarArbol(ar^.HD, a);
		end;
	end;
	
	procedure cargarArbol (var ar: arbol);
	var
		a: alumno;
	begin
		leerAlumno(a);
		while (a.legajo <> 0) do begin
			agregarArbol(ar,a);
			leerAlumno(a);
		end;
	end;
	
	function devolverCantImpares (a: arbol): integer;
	begin
		if (a = nil) then begin
			devolverCantImpares:= 0;
		end
		else
			if (a^.dato.legajo MOD 2 = 1) then begin
				devolverCantImpares:= 1 + devolverCantImpares(a^.HI) + devolverCantImpares(a^.HD);
			end
			else
				devolverCantImpares:= devolverCantImpares(a^.HI) + devolverCantImpares(a^.HD);
	end;
	
	function contarAprobados (l: lista): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.nota >= 4) then begin
				cant:= cant + 1;
			end;
			l:= l^.sig;
		end;
		contarAprobados:= cant;
	end;
	
	procedure informarArbol (a: arbol);
	begin
		if (a <> nil) then begin
			informarArbol(a^.HI);
			writeln('Legajo: ', a^.dato.legajo, ' Cantidad de finales aprobados: ', contarAprobados(a^.lista));
			informarArbol(a^.HD);
		end;
	end;	
	
	function sacarPromedio (l: lista): real;
	var
		cant: integer;
		sumaNotas: real;
	begin
		cant:= 0;
		sumaNotas:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			sumaNotas:= sumaNotas + l^.dato.nota;
		end;
		sacarPromedio:= sumaNotas / cant;
	end;
	
	procedure agregarAdelante2 (var l: lista2; reg: regLista);
	var
		nue: lista2;
	begin
		new(nue);
		nue^.dato:= reg;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure retornarInfoLista2 (var l: lista2; valor: real; a: arbol);
	var
		reg: regLista;
		prom: real;
	begin
		if (a <> nil) then begin
			retornarInfoLista2(l, valor, a^.HI);
			prom:= sacarPromedio(a^.lista);
			if (prom > valor) then begin
				reg.legajo:= a^.dato.legajo;
				reg.promedio:= prom;
				agregarAdelante2(l, reg);
			end;
			retornarInfoLista2(l, valor, a^.HD);
		end;
	end;
	
	

var
	a: arbol;
	l: lista2;
	valor: real;
begin
	a:= nil;
	cargarArbol(a);
	writeln('La cantidad de alumnos con legajo impar es: ', devolverCantImpares(a));
	writeln;
	informarArbol(a);
	writeln;
	writeln('Ingrese un valor: ');
	readln(valor);
	retornarInfoLista2(l, valor, a);
end.
