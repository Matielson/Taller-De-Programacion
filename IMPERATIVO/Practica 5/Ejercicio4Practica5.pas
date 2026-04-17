{Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:

a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.

b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.

c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

program ejercicio4practica5;

type

	reclamo = record
		cod: integer;
		dni: integer;
		ano: integer;
		tipo: string;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: reclamo;
		sig: lista;
	end;
	
	listaReclamos =^nodoLista2;
	nodoLista2 = record
		dato: integer;
		sig: listaReclamos;
	end;
	
	regArbol = record
		listaReclamos: lista;
		cantTotal: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dni: integer;
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerReclamo (var r: reclamo);
	begin
		writeln('Ingrese el codigo de reclamo: ');
		readln(r.cod);
		if (r.cod <> 0) then begin
			writeln('Ingrese el DNI de la persona: ');
			readln(r.dni);
			writeln('Ingrese el año: ');
			readln(r.ano);
			writeln('Ingrese el tipo de reclamo: ');
			readln(r.tipo);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; r: reclamo);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= r;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol (var a: arbol; r: reclamo);
	begin
		if (a = nil) then begin
			new(a);
			a^.dni:= r.dni;
			a^.dato.listaReclamos:= nil;
			a^.dato.cantTotal:= 1;
			agregarAdelante(a^.dato.listaReclamos, r);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (a^.dni = r.dni) then begin
				agregarAdelante(a^.dato.listaReclamos, r);
				a^.dato.cantTotal:= a^.dato.cantTotal + 1;
			end
			else
				if (a^.dni > r.dni) then
					agregarArbol(a^.HI, r)
				else
					agregarArbol(a^.HD, r);
		end;
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		r: reclamo;
	begin
		leerReclamo(r);
		while (r.cod <> 0) do begin
			agregarArbol(a,r);
			leerReclamo(r);
		end;
	end;
	
	function retornarCantReclamos (a: arbol; dni: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantReclamos:= 0;
		end
		else begin
			if (a^.dni = dni) then begin
				retornarCantReclamos:= a^.dato.cantTotal;
			end
			else
				if (a^.dni > dni) then
					retornarCantReclamos:= retornarCantReclamos (a^.HI, dni)
				else
					retornarCantReclamos:= retornarCantReclamos (a^.HD, dni);
		end
	end;
	
	function retornarCantEntreDos (a: arbol; valor1: integer; valor2: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantEntreDos:= 0;
		end
		else
			if (a^.dni >= valor1) and (a^.dni <= valor2) then begin
				retornarCantEntreDos:= a^.dato.cantTotal + retornarCantEntreDos (a^.HI, valor1, valor2) + retornarCantEntreDos (a^.HD, valor1, valor2);
			end
			else
				if (a^.dni < valor1) then
					retornarCantEntreDos:= retornarCantEntreDos(a^.HD, valor1, valor2)
				else
					retornarCantEntreDos:= retornarCantEntreDos(a^.HI, valor1, valor2);
	end;
	
	procedure agregarAdelante2 (var l: listaReclamos; cod: integer);
	var
		nue: listaReclamos;
	begin
		new(nue);
		nue^.dato:= cod;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarAListaCond (l: lista; ano: integer; var lR: listaReclamos);
	begin
		while (l <> nil) do begin
			if (l^.dato.ano = ano) then begin
				agregarAdelante2 (lR, l^.dato.cod);
			end;
			l:= l^.sig;
		end;
	end;
	
	procedure retornarCode (a: arbol; ano: integer; var l: listaReclamos);
	begin
		if (a <> nil) then begin
			retornarCode (a^.HI, ano, l);
			agregarAListaCond (a^.dato.listaReclamos, ano, l);
			retornarCode (a^.HD, ano, l);
		end;
	end;

var
	a: arbol;
begin
	a:= nil;
	cargarArbol(a);
end.
