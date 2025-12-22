program Ejercicio4;
const
	año = 2021;
type

	prestamo = record
		isbn: integer;
		numS: integer;
		dia: string;
		mes: string;
		cantD: integer;
	end;
	
	prestamoNuevo = record
		numS: integer;
		dia: string;
		mes: string;
		cantD: integer;
	end;
	
	arbol = ^nodoArbol
	
	nodoArbol = record
		dato: prestamo;
		HI: arbol;
		HD: arbol;
	end;
		
	arbol2 = ^nodoArbol2
	
	nodoArbol2 = record
		ISBN: integer;
		dato: lista;
		HI: arbol2;
		HD: arbol2;
	end;
		
	lista = ^nodoLista
	
	nodoLista = record
		dato: prestamoNuevo;
		sig: lista;
	end;
	
	arbol3 = ^nodoArbol3
	
	nodoArbol3 = record
		ISBN: integer;
		dato: integer;
		HI: arbol3;
		HD: arbol3;
	end;
	
	procedure leerPrestamo (var p: prestamo);
	begin
		writeln('Inserte');
		readln(p.isbn);
		if (p.isbn <> 0) then begin
			readln(p.numS);
			readln(p.dia);
			readln(p.mes);
			readln(p.cantD);
		end;
	end;

	procedure insertarArbol(var a1: arbol; p: prestamo);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato := p;
			a1^.HI := nil;
			a1^.HD := nil;
		end
		else begin
			if (p.isbn < a1^.dato.isbn) then
				insertarArbol(a1^.HI, p)
			else
				insertarArbol(a1^.HD, p);
		end;
	end;
	
	procedure agregarAdelante(var l: lista; pn: prestamoNuevo);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= pn;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
	
	procedure insertarArbol2(var a2: arbol2; p: prestamo);
	var
		l: lista;
		pn: prestamoNuevo;
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato := nil;
			pn.numS:= p.numS;
			pn.dia:= p.dia;
			pn.mes:= p.mes;
			pn.cantD:= p.cantD;
			agregarAdelante(a2^.dato,pn);
			a2^.isbn:= p.isbn;
			a2^.HI := nil;
			a2^.HD := nil;
		end
		else begin
			if (a2^.isbn = p.isbn) then begin
				pn.numS:= p.numS;
				pn.dia:= p.dia;
				pn.mes:= p.mes;
				pn.cantD:= p.cantD;
				agregarAdelante(a2^.dato,pn);
			end
			else
				if (p.isbn < a2^.isbn) then insertarArbol2(a2^.HI, p)
				else insertarArbol2(a2^.HD, p);
		end;
	end;
	
	procedure generarArboles (var a1: arbol; var a2: arbol);
	var
		p: prestamo;
	begin
		leerPrestamo(p);
		while (p.isbn <>0) then begin
			insertarArbol(a1,p);
			insertarArbol2(a2,p);
			leerPrestamo(p);
		end;
	end;
	
	procedure isbnMasGrande (a1: arbol; var max: integer);
	begin
		if (a1 <> nil) then begin
			if (a1^.HD = nil) then begin
				max:= a1^.dato.isbn;
			end
			else
				isbnMasGrande(a1^.HD, max);
		end
		else
			max:= -1;
			writeln('Se devuelve el valor -1 debido a que el arbol esta vacio.');
	end;
	
	procedure isbnMasChico (a2: arbol2; var min: integer);
	begin
		if (a2 <> nil) then begin
			if (a2^.HI = nil) then begin
				min:= a2^.isbn;
			end
			else
				isbnMasGrande(a2^.HI, max);
		end
		else
			min:= -1;
			writeln('Se devuelve el valor -1 debido a que el arbol esta vacio.');
	end;
	
	function cantPrestamosSocio (a1: arbol; numSocio: integer): integer;
	begin
		if (a1 = nil) then begin
			writeln('El arbol esta vacio o no se encontro el socio pedido.');
		end
		else
			if (numSocio = a1^.dato.numS) then begin
				cantPrestamosSocio:= 1 + cantPrestamosSocio(a1^.HI, numSocio) + cantPrestamosSocio(a1^.HD,numSocio);
			end
			else
				cantPrestamosSocio:= cantPrestamosSocio(a1^.HI, numSocio) + cantPrestamosSocio(a1^.HD,numSocio);
		end;
	end;
	
	function recorrerListaYContar(l: lista; numSocio: integer): integer;
	var
	  total: integer;
	begin
	  total := 0;
	  while (l <> nil) do begin
		if (l^.dato.numS = numSocio) then
		  total := total + 1;
		l := l^.sig;
	  end;
	  recorrerListaYContar := total;
	end;
	
	function cantPrestamosSocio2 (a2: arbol2; numSocio: integer): integer;
	begin
		if (a2 = nil) then begin
			writeln('El arbol esta vacio o no se encontro el socio pedido.');
		end
		else
			cantPrestamosSocio2:= recorrerListaYContar(a2^.dato, numSocio) + cantPrestamosSocio2(a2^.HI, numSocio) + cantPrestamosSocio2(a2^.HD,numSocio);
		end;
	end;
	
	procedure insertarArbol3(var a3: arbol3; isbn: integer);
	var
		l: lista;
		pn: prestamoNuevo;
	begin
		if (a2 = nil) then begin
			new(a3);
			a3^.isbn:= isbn;
			a3^.dato := 1;
			a3^.HI := nil;
			a3^.HD := nil;
		end
		else begin
			if (isbn = a3^.isbn) then begin
				pn.numS:= p.numS;
				pn.dia:= p.dia;
				pn.mes:= p.mes;
				pn.cantD:= p.cantD;
				agregarAdelante(a2^.dato,pn);
			end
			else
				if (p.isbn < a2^.isbn) then insertarArbol2(a2^.HI, p)
				else insertarArbol2(a2^.HD, p);
		end;
	end;
	
	procedure generarArbol3 (var a3: arbol3; a1: arbol);
	begin
		if (a1 <> nil) then begin
			generarArbol3(a3, a1^.HI);
			insertarArbol3(a3, a1^.dato.isbn);
			generarArbol3(a3, a1^.HD);
		end;
	end;
	
var
	a1: arbol;
	a2: arbol2;
	a3: arbol3;
	p: prestamo;
	max, min, numSocio: integer;
begin
	a1:= nil;
	a2:= nil;
	generarArboles(a1,a2);
	writeln('2 Arboles fueron generados.');
	isbnMasGrande(a1,max);
	writeln('El codigo ISBN mas grande encontrado fue: ', max);
	isbnMasChico(a2,min);
	writeln('El codigo ISBN mas chico encontrado fue: ', min);
	writeln('Ingrese un codigo de socio a buscar en ambos arboles: ');
	readln(numSocio);
	writeln('La cantidad de prestamos del socio', numSocio 'en el arbol 1 es', cantPrestamosSocio(a1,numSocio));
	writeln('La cantidad de prestamos del socio', numSocio 'en el arbol 2 es', cantPrestamosSocio2(a2,numSocio));
	generarArbol3(a3,a1);
	writeln('Arbol numero 3 fue generado.');
end.
