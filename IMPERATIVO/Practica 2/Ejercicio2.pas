program Ejercicio2;
const
	ext1 = 100;
	ext2 = 200;
	
	
type rango = 1..5
	
	
	lista = ^nodo
	
	nodo = record;
		dato: integer;
		sig: lista;
	end;

	procedure crearNodoYAgregar (var l: lista; num: integer);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.dato:= num;
		nuevo^.sig:= lista;
		l:= nuevo;
	end;

	procedure crearListaRecursivo (var l: lista);
	var
		num: integer;
	begin
		num:= random(ext2-ext1+1)+ext1;
		if ( num <> 100) then begin;
			crearNodoYAgregar (l, num);
			crearListaRecursivo(l);
		end;
		else begin
			l^.sig:= nil;
		end;
	end;
	
	procedure imprimirEnOrden (l: lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			imprimirEnOrden(l^.sig);
		end;
	end;

	procedure imprimirEnInverso (l: lista);
	begin
		if (l <> nil) then begin
			imprimirEnInverso(l^.sig);
			writeln(l^.dato);
		end;
	end; 

	function min (a,b: int): integer;
	begin
		if (a < b) then begin
			min:= a;
		end;
		else
			min:= b;
	end;

	function rec (l:lista): integer;
	begin
		if (l <> nil) then begin
			rec:= min(l^.dato; rec (l^.sig));
		end;
		else
			rec:= 99999;
	end;

	function encontrar (l: lista; valor: integer): boolean;
	begin
		if (l = nil) then begin
			encontrar:= false;
		end;
		else if (l^.dato = valor) then begin
			encontrar:= true;
		end;
		else begin
			encontrar(l^.sig;valor);
		end;
	end;



var
	l: lista;
	valor: integer;
begin
	randomize;
	l:= nil;
	crearListaRecursivo(l);
	imprimirEnOrden(l);
	imprimirEnInverso(l);
	rec (l);
	writeln('Ingrese el valor a encontrar: ');
	readln(valor);
	encontrar(l,valor);
end.
