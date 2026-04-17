program ejercicio2practica2;

type

	lista = ^nodoLista;
	
	nodoLista = record
		dato: integer;
		sig: lista;
	end;
	
	/// INCISO A
	
	procedure agregarAdelante (var l: lista; num: integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= num;
		nue^.sig:= l;
		l:= nue;
	end;

	procedure cargarListaRecursivo (var l: lista);
	var
		num: integer;
	begin
		num:= Random(200-100+1) + 100;
		if (num <> 100) then begin
			agregarAdelante(l,num);
			cargarListaRecursivo(l);
		end;
	end;
	
	/// INCISO B
	
	procedure imprimirListaRecursivo (l: lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			imprimirListaRecursivo(l^.sig);
		end;
	end;
	
	/// INCISO C
	
	procedure imprimirListaInversoRecursivo (l: lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			imprimirListaInversoRecursivo(l^.sig);
		end;
	end;
	
	/// INCISO D
	
	function devolverMinimoRecursivo (l: lista): integer;
	var
		minResto: integer;
	begin
		if (l = nil) then begin
			devolverMinimoRecursivo:= 9999;
		end
		else begin
			minResto := devolverMinimoRecursivo(l^.sig);
			if (l^.dato < minResto) then
				devolverMinimoRecursivo := l^.dato
			else
				devolverMinimoRecursivo := minResto;
		end;
	end;
	
	/// INCISO E
	
	function devolverSiEsta (l: lista; valor: integer): boolean;
	begin
		if (l = nil) then begin
			devolverSiEsta:= false;
		end
		else
			if (l^.dato = valor) then begin
				devolverSiEsta:= true;
			end
			else
				devolverSiEsta:= devolverSiEsta(l^.sig, valor);
	end;
	

var
	l: lista;
	valor: integer;
begin
	Randomize;
	l:= nil;
	cargarListaRecursivo(l);
	imprimirListaRecursivo(l);
	imprimirListaInversoRecursivo(l);
	writeln('El minimo de la lista es: ', devolverMinimoRecursivo(l));
	writeln;
	writeln('Ingrese un elemento a buscar en la lista: ');
	readln(valor);
	if (devolverSiEsta(l, valor)) then
		writeln('El elemento ', valor, ' esta en la lista')
	else
		writeln('El elemento ', valor, ' no esta en la lista');
end.
