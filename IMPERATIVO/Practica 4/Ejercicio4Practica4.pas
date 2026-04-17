program ejercicio4practica4;

type

	rangoDias = 1..31;
	rangoMes = 1..12;

	prestamo = record
		isbn: integer;
		numS: integer;
		dia: rangoDias;
		mes: rangoMes;
		cantDias: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: prestamo;
		HI: arbol;
		HD: arbol;
	end;
	
	prestamoNuevo = record
		numS: integer;
		dia: rangoDias;
		mes: rangoMes;
		cantDias: integer;
	end;
	
	listaPrestamos = ^nodoLista;
	nodoLista = record
		dato: prestamoNuevo;
		sig: listaPrestamos;
	end;
	
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		isbn: integer;
		dato: listaPrestamos;
		HI: arbol2;
		HD: arbol2;
	end;
	
	regArbol = record
		isbn: integer;
		cant: integer;
	end;
	
	arbol3 = ^nodoArbol3;
	nodoArbol3 = record
		dato: regArbol;
		HI: arbol3;
		HD: arbol3;
	end;
	
	arbol4 = ^nodoArbol4;
	nodoArbol4 = record
		dato: regArbol;
		HI: arbol4;
		HD: arbol4;
	end;
	
	/// INCISO A
	
	procedure leerPrestamo (var p: prestamo);
	begin
		writeln('Ingrese el ISBN del libro: ');
		readln(p.isbn);
		if (p.isbn <> 0) then begin
			writeln('Ingrese el numero de socio: ');
			readln(p.numS);
			writeln('Ingrese el dia y mes del prestamo: ');
			readln(p.dia);
			readln(p.mes);
			writeln('Ingrese la cantidad de dias del prestamo: ');
			readln(p.cantDias);
		end;
	end;
	
	procedure agregarArbol1 (var a1: arbol; p: prestamo);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato:= p;
			a1^.HI:= nil;
			a1^.HD:= nil;
		end
		else
			if (a1^.dato.isbn > p.isbn) then
				agregarArbol1 (a1^.HI, p)
			else
				agregarArbol1 (a1^.HD, p);
	end;
	
	procedure agregarAdelante (var l: listaPrestamos; p: prestamo);
	var
		nue: listaPrestamos;
		pN: prestamoNuevo;
	begin
		new(nue);
		pN.numS:= p.numS;
		pN.dia:= p.dia;
		pN.mes:= p.mes;
		pN.cantDias:= p.cantDias;
		nue^.dato:= pN;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol2 (var a2: arbol2; p: prestamo);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato:= nil;
			a2^.isbn:= p.isbn;
			agregarAdelante(a2^.dato, p);
			a2^.HI:= nil;
			a2^.HD:= nil;
		end
		else
			if (a2^.isbn = p.isbn) then begin
				agregarAdelante(a2^.dato, p);
			end
			else
				if (a2^.isbn > p.isbn) then
					agregarArbol2 (a2^.HI, p)
				else
					agregarArbol2 (a2^.HD, p);
	end;
	
	procedure cargarArboles (var a1: arbol; var a2: arbol2);
	var
		p: prestamo;
	begin
		leerPrestamo(p);
		while (p.isbn <> 0) do begin
			agregarArbol1 (a1, p);
			agregarArbol2 (a2, p);
			leerPrestamo(p);
		end;	
	end;
	
	/// INCISO B
	
	function retornarMayorIsbn (a: arbol): integer;
	begin
		if (a = nil) then begin
			retornarMayorIsbn:= -1;
		end
		else
			if (a^.HD = nil) then
				retornarMayorIsbn:= a^.dato.isbn
			else
				retornarMayorIsbn:= retornarMayorIsbn(a^.HD);
	end;
	
	/// INCISO C
	
	function retornarMenorIsbn (a: arbol2): integer;
	begin
		if (a = nil) then begin
			retornarMenorIsbn:= -1;
		end
		else
			if (a^.HI = nil) then
				retornarMenorIsbn:= a^.isbn
			else
				retornarMenorIsbn:= retornarMenorIsbn (a^.HI);
	end;
	
	/// INCISO D
	
	function retornarCantPrestamos (a: arbol; num: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantPrestamos:= 0;
		end
		else
			if (a^.dato.numS = num) then begin
				retornarCantPrestamos:= 1 + retornarCantPrestamos (a^.HI, num) + retornarCantPrestamos (a^.HD, num);
			end
			else
				retornarCantPrestamos:= retornarCantPrestamos (a^.HI, num) + retornarCantPrestamos (a^.HD, num);
	end;
	
	/// INCISO E
	
	function cantEnLista (l: listaPrestamos; num: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.numS = num) then begin
				cant:= cant + 1;
			end;
			l:= l^.sig;
		end;
		cantEnLista:= cant;
	end;
	
	function retornarCantPrestamos2 (a: arbol2; num: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantPrestamos2:= 0;
		end
		else
			retornarCantPrestamos2:= cantEnLista(a^.dato, num) + retornarCantPrestamos2 (a^.HI, num) + retornarCantPrestamos2 (a^.HD, num);
	end;
	
	/// INCISO F
	
	procedure agregarArbol3 (var a: arbol3; isbn: integer);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.isbn:= isbn;
			a^.dato.cant:= 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.dato.isbn = isbn) then begin
				a^.dato.cant:= a^.dato.cant + 1;
			end
			else
				if (a^.dato.isbn > isbn) then
					agregarArbol3 (a^.HI, isbn)
				else
					agregarArbol3 (a^.HD, isbn);
	end;
	
	procedure generarArbol3 (a: arbol; var a3: arbol3);
	begin
		if (a <> nil) then begin
			generarArbol3 (a^.HI, a3);
			agregarArbol3 (a3, a^.dato.isbn);
			generarArbol3 (a^.HD, a3);
		end;
	end;
	
	/// INCISO G
	
	procedure generarArbol4 (a: arbol2; var a4: arbol4);
	begin
	
	end;
	
var

begin


end;
