{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información
de los autos en venta. Implementar un programa que:

a) Genere la información de los autos (patente, año de fabricación (2015..2024), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos:

i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar juntas las patentes y colores de los autos pertenecientes a ella.

b) Invoque a un módulo que reciba la estructura generada en a) i y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generada en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
color del auto con dicha patente.}


program ejercicio2practica5;

type

	rangoAnos = 2015..2024;

	auto = record
		patente: integer;
		ano: rangoAnos;
		marca: string;
		color: string;
		modelo: string;
	end;
	
	arbol1 = ^nodoArbol1;
	nodoArbol1 = record
		dato: auto;
		HI: arbol1;
		HD: arbol1;
	end;
	
	autoNuevo = record
		patente: integer;
		color: string;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: autoNuevo;
		sig: lista;
	end;
	
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		marca: string;
		dato: lista;
		HI: arbol2;
		HD: arbol2;
	end;
	
	procedure leerAuto (var a: auto);
	begin
		writeln('Ingrese la marca del vehiculo: ');
		readln(a.marca);
		if (a.marca <> 'MMM') then begin
			writeln('Ingrese la patente del vehiculo: ');
			readln(a.patente);
			writeln('Ingrese el año de fabricacion (2015-2024): ');
			readln(a.ano);
			writeln('Ingrese el color del vehiculo: ');
			readln(a.color);
			writeln('Ingrese el modelo del vehiculo: ');
			readln(a.modelo);
		end;
	end;
	
	procedure agregarArbol1 (var ar: arbol1; a: auto);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dato:= a;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else begin
			if (ar^.dato.patente > a.patente) then
				agregarArbol1(ar^.HI, a)
			else
				agregarArbol1(ar^.HD, a);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; a: auto);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato.patente:= a.patente;
		nue^.dato.color:= a.color;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol2 (var ar: arbol2; a: auto);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.marca:= a.marca;
			ar^.dato:= nil;
			agregarAdelante(ar^.dato, a);
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else begin
			if (ar^.marca = a.marca) then
				agregarAdelante(ar^.dato, a)
			else
				if (ar^.marca > a.marca) then
					agregarArbol2(ar^.HI, a)
				else
					agregarArbol2(ar^.HD, a);
		end;
	end;
	
	procedure cargarArboles (var ar1: arbol1; var ar2: arbol2);
	var
		a: auto;
	begin
		leerAuto(a);
		while (a.marca <> 'MMM') do begin
			agregarArbol1(ar1, a);
			agregarArbol2(ar2, a);
			leerAuto(a);
		end;
	end;
	
	function retornarCantAutos (a: arbol1; marca: string): integer;
	begin
		if (a = nil) then begin
			retornarCantAutos:= 0;
		end
		else
			if (a^.dato.marca = marca) then
				retornarCantAutos:= 1 + retornarCantAutos(a^.HI, marca) + retornarCantAutos(a^.HD, marca)
			else
				retornarCantAutos:= retornarCantAutos(a^.HI, marca) + retornarCantAutos(a^.HD, marca);
	end;
	
	function retornarCantEnLista (l: lista): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		retornarCantEnLista:= cant;
	end;
	
	function retornarCantAutos2 (a: arbol2; marca: string): integer;
	begin
		if (a = nil) then begin
			retornarCantAutos2:= 0;
		end
		else
			if (a^.marca = marca) then
				retornarCantAutos2:= retornarCantEnLista(a^.dato) + retornarCantAutos2 (a^.HI, marca) + retornarCantAutos2 (a^.HD, marca)
			else
				if (a^.marca > marca) then
					retornarCantAutos2:= retornarCantAutos2 (a^.HI, marca)
				else
					retornarCantAutos2:= retornarCantAutos2 (a^.HD, marca);
	end;
	
var
	a1: arbol1;
	a2: arbol2;
begin
	a1:= nil;
	a2:= nil;
	cargarArboles(a1,a2);
end.
