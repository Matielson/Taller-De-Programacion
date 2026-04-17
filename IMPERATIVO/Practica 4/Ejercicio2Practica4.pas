{En el programa del Ejercicio 1 - Clase 3, incorporar lo necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer dos valores e informar la cantidad de socios cuyos códigos se encuentran
comprendidos entre los valores leídos. Debe invocar a un módulo recursivo que reciba
los valores leídos y retorne la cantidad solicitada.}


program ejercicio2practica4;

type

	socio = record
		num: integer;
		nombre: string;
		edad: integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;
	
	/// INCISO A
	
	procedure leerSocio (var s: socio);
	begin
		s.num:= Random(1001);
		if (s.num <> 0) then begin
			readln(s.nombre);
			s.edad:= Random(100);
		end;
	end;
	
	procedure agregarArbol (var a: arbol; s: socio);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= s;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (s.num <= a^.dato.num) then 
				agregarArbol(a^.HI, s)
			else
				agregarArbol(a^.HD, s);
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		s: socio;
	begin
		leerSocio(s);
		while (s.num <> 0) do begin
			agregarArbol(a,s);
			leerSocio(s);
		end;
	end;
	
	/// INCISO B i
	
	procedure imprimirArbolCreciente (a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbolCreciente(a^.HI);
			writeln(a^.dato.num);
			imprimirArbolCreciente(a^.HD);
		end;
	end;
	
	/// INCISO B ii
	
	procedure imprimirArbolDecreciente (a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbolCreciente(a^.HD);
			writeln(a^.dato.num);
			imprimirArbolCreciente(a^.HI);
		end;
	end;
	
	/// INCISO B iii
	
	procedure informarMayorEdad (a: arbol; var num: integer; var maxEdad: integer);
	begin
		if (a <> nil) then begin
			informarMayorEdad(a^.HI, num, maxEdad);
			if (a^.dato.edad > maxEdad) then begin
				maxEdad:= a^.dato.edad;
				num:= a^.dato.num;
			end;
			informarMayorEdad(a^.HD, num, maxEdad);
		end;
	end;
	
	/// INCISO B iv
	
	procedure aumentarEdad (var a: arbol; var num: integer);
	begin
		if (a <> nil) then begin
			aumentarEdad(a^.HI, num);
			if ((a^.dato.edad MOD 2) = 1) then begin
				a^.dato.edad:= a^.dato.edad + 1;
				num:= num + 1;
			end;
			aumentarEdad(a^.HD, num);
		end;
	end;
	
	/// INCISO B vi
	
	function devolverSiEsta (a: arbol; nom: string): boolean;
	begin
		if (a <> nil) then begin
			devolverSiEsta:= false;
		end
		else
			if (a^.dato.nombre = nom) then begin
				devolverSiEsta:= true;
			end
			else
				devolverSiEsta:= devolverSiEsta (a^.HI, nom) or devolverSiEsta(a^.HD, nom);
	end;
	
	/// INCISO B vii
	
	function devolverCantSocios (a: arbol): real;
	begin
		if (a = nil) then begin
			devolverCantSocios:= 0;
		end
		else
			devolverCantSocios:= devolverCantSocios(a^.HI) + devolverCantSocios(a^.HD) + 1;
	end;
	
	/// INCISO B viii
	
	function devolverSumaEdades (a: arbol): real;
	begin
		if (a = nil) then begin
			devolverSumaEdades:= 0;
		end
		else
			devolverSumaEdades:= a^.dato.edad + devolverSumaEdades(a^.HI) + devolverSumaEdades(a^.HD);
	end;
	
	
	
	
	///
	///	AGREGADOS AL EJERCICIO 1 PRACTICA 3 (LO QUE PIDE EL EJERCICIO 2 PRACTICA 4)
	///
	
	
	function retornarMaxNumSocio (a: arbol): integer;
	begin
		if (a = nil) then begin
			retornarMaxNumSocio:= -1;
		end
		else
			if (a^.HD = nil) then
				retornarMaxNumSocio:= a^.dato.num
			else
				retornarMaxNumSocio:= retornarMaxNumSocio (a^.HD);
	end;
	
	function retornarSiEsta (a: arbol; num: integer): boolean;
	begin
		if (a = nil) then begin
			retornarSiEsta:= false;
		end
		else
			if (a^.dato.num = num) then begin
				retornarSiEsta:= true;
			end
			else
				if (a^.dato.num > num) then begin
					retornarSiEsta:= retornarSiEsta(a^.HI, num);
				end
				else
					retornarSiEsta:= retornarSiEsta(a^.HD, num);
	end; 
	
	function retornarEntreValores (a: arbol; valor1: integer; valor2: integer): integer;
	begin
		if (a = nil) then begin
			retornarEntreValores:= 0;
		end
		else
			if (a^.dato.num >= valor1) and (a^.dato.num <= valor2) then begin
				retornarEntreValores:= 1 + retornarEntreValores(a^.HI, valor1, valor2) + retornarEntreValores(a^.HD, valor1, valor2);
			end
			else
				if (a^.dato.num < valor1) then
					retornarEntreValores:= retornarEntreValores(a^.HD, valor1, valor2)
				else
					retornarEntreValores:= retornarEntreValores(a^.HI, valor1, valor2);
	end;
	
	///
	/// FIN AGREGADOS EJERCICIO 2 PRACTICA 4
	///
var
	a: arbol;
	num, maxEdad: integer;
	nombreABuscar: string;
	promedio: real;
	numSocioABuscar: integer;
begin
	a:= nil;
	cargarArbol(a);
	imprimirArbolCreciente(a);
	writeln;
	imprimirArbolDecreciente(a);
	writeln;
	num:= -1;
	maxEdad:= -1;
	informarMayorEdad(a,num,maxEdad);
	num:= 0;
	aumentarEdad(a,num);
	readln(nombreABuscar);
	devolverSiEsta(a,nombreABuscar);
	writeln;
	promedio:= devolverSumaEdades(a) / devolverCantSocios(a) * 100;
	
	///
	/// AGREGADOS EJERCICIO 2 PRACTICA 4
	///
	
	writeln('El numero de socio mas grande es: ', retornarMaxNumSocio(a));
	
	readln(numSocioABuscar);
	if (retornarSiEsta(a,numSocioABuscar)) then
		writeln('El numero de socio ingresado esta en el sistema.')
	else
		writeln('El numero de socio ingresado no fue encontrado en el sistema.');
		
	readlm
	
	///
	/// FIN AGREGADOS EJERCICIO 2 PRACTICA 4
	///
end.
