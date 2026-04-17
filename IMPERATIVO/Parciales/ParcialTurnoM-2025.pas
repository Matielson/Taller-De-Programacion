{Una clínica odontológica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes en julio de 2025.
a) Implementar un módulo que lea información de las atenciones.
De cada atención se lee: matrícula del odontólogo, DNI del paciente, día y diagnóstico (valor entre 1 y 10).
La lectura finaliza con el DNI 0. Se sugiere utilizar el módulo leerAtencion().
El módulo debe retornar un árbol binario de búsqueda ordenado por matrícula del odontólogo.
Para cada matrícula de odontólogo deben almacenarse las atenciones realizadas.
b) Implementar un módulo que reciba el árbol generado en a), dos matrículas y un valor entero.
El módulo debe retornar la cantidad total de atenciones realizadas al paciente con DNI igual al valor ingresado por odontólogos con matrículas entre las dos matrículas ingresadas (sin incluir).
c) Realizar un módulo que reciba el árbol generado en a), y retorne, para cada diagnóstico, la cantidad de atenciones realizadas.
}

program parcialTurnoM;

type

	rangoDiagnostico = 1..10;

	atencion = record
		matricula: integer;
		dni: integer;
		dia: integer;
		diagnostico: rangoDiagnostico;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: atencion;
		sig: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		matricula: integer;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	vDiagnosticos = array [rangoDiagnostico] of integer;
	
	/// INCISO A
	
	procedure leerAtencion (var at: atencion);
	begin
		writeln('Ingrese el DNI del paciente: ');
		readln(at.dni);
		if (at.dni <> 0) then begin
			writeln('Ingrese la matricula del odontologo: ');
			readln(at.matricula);
			writeln('Ingrese el dia de la atencion: ');
			readln(at.dia);
			writeln('Ingrese el diagnostico (1-10): ');
			readln(at.diagnostico);
			writeln;
		end;
	end;
	
	procedure agregarAdelante (var l: lista; a: atencion);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= a;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol (var a: arbol; at: atencion);
	begin
		if (a = nil) then begin
			new(a);
			a^.matricula:= at.matricula;
			a^.dato:= nil;
			agregarAdelante(a^.dato, at);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.matricula = at.matricula) then begin
				agregarAdelante(a^.dato,at);
			end
			else
				if (a^.matricula > at.matricula) then
					agregarArbol(a^.HI, at)
				else
					agregarArbol(a^.HD, at);
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		at: atencion;
	begin
		leerAtencion(at);
		while (at.dni <> 0) do begin
			agregarArbol(a,at);
			leerAtencion(at);
		end;
	end;
	
	/// INCISO B
	
	function contarNodosLista (l: lista; dni: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.dni = dni) then begin
				cant:= cant + 1
			end;
			l:= l^.sig;
		end;
		contarNodosLista:= cant;
	end;
	
	function retornarCantEntre (a: arbol; valor1: integer; valor2: integer; dni: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantEntre:= 0;
		end
		else begin
			if (a^.matricula > valor1) and (a^.matricula < valor2) then begin
				retornarCantEntre:= contarNodosLista(a^.dato, dni) + retornarCantEntre (a^.HI, valor1, valor2, dni) + retornarCantEntre (a^.HD, valor1, valor2, dni);
			end
			else begin
				if (a^.matricula <= valor1) then
					retornarCantEntre:= retornarCantEntre(a^.HD, valor1, valor2, dni)
				else
					retornarCantEntre:= retornarCantEntre(a^.HI, valor1, valor2, dni);
			end;
		end;
	end;
	
	/// INCISO C
	
	procedure inicializarVector (var v: vDiagnosticos);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			v[i]:= 0;
		end;
	end;
	
	procedure recorrerListaYSumar (l: lista; var v: vDiagnosticos);
	begin
		while (l <> nil) do begin
			v[l^.dato.diagnostico]:= v[l^.dato.diagnostico] + 1;
			l:= l^.sig;
		end;
	end;
	
	procedure retornarVectorDiag (a: arbol; var v: vDiagnosticos);
	begin
		if (a <> nil) then begin
			retornarVectorDiag (a^.HI, v);
			recorrerListaYSumar (a^.dato, v);
			retornarVectorDiag (a^.HD, v);
		end;
	end;

var
	a: arbol;
	valor1,valor2,dni, i: integer;
	v: vDiagnosticos;
begin
	a:= nil;
	cargarArbol(a);
	
	writeln('Valor1: ');
	readln(valor1);
	writeln('Valor2: ');
	readln(valor2);
	writeln('Dni: ');
	readln(dni);
	writeln('La cantidad total de atenciones realizadas al paciente con dni: ', dni, ' otorgadas por odontologos con matriculas entre los valores: ', valor1, ' y ', valor2, ' son: ', retornarCantEntre(a,valor1,valor2,dni));
	
	inicializarVector(v);
	retornarVectorDiag (a, v);
	writeln('Vector generado con la cantidad de atenciones realizadas por cada diagnostico.');
	for i:= 1 to 10 do begin
		writeln('Diagnostico: ', i, ' Atenciones: ', v[i]);
	end;
end.
