program gork;

const
	
	ext1 = 2000;
	ext2 = 2023;
	
type
	
	rango = ext1..ext2;
	
	poliza = record
		dni: integer;
		suma: real;
		valor: real;
		fecha: integer;
	end;
	
	polizaVector = record
		dni: integer;
		suma: real;
		valor: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: poliza;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: polizaVector;
		sig: lista;
	end;
	
	vAnios = array [rango] of lista;
	
	procedure leerPoliza(var p: poliza);
	begin
		writeln('Ingrese el DNI del cliente (-1 para finalizar): ');
		readln(p.dni);
		if (p.dni <> -1) then begin
			writeln('Ingrese la suma asegurada: ');
			readln(p.suma);
			writeln('Ingrese el valor de la cuota: ');
			readln(p.valor);
			writeln('Ingrese la fecha de vencimiento: ');
			readln(p.fecha);
		end;
	end;
	
	procedure insertarArbol (var a: arbol; p: poliza);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (p.suma <= a^.dato.suma) then insertarArbol(a^.HI,p)
			else insertarArbol(a^.HD,p);
	end;
	
	procedure generarArbol (var a: arbol);
	var
		p: poliza;
	begin
		leerPoliza(p);
		while (p.dni <> -1) do begin
			insertarArbol(a,p);
			leerPoliza(p);
		end;
	end;
	
	procedure imprimirPoliza(var p: poliza);
	begin
		writeln('-----');
		writeln('DNI: ',p.dni);
		writeln('-----');
		writeln('SUMA ASEGURADA: ',p.suma:0:2);
		writeln('-----');
		writeln('VALOR DE CUOTA: ',p.valor:0:2);
		writeln('-----');
		writeln('FECHA DE VENCIMIENTO: ',p.fecha);
		writeln('-----');
	end;
	
	procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirPoliza(a^.dato);
			imprimirArbol(a^.HI);
			imprimirArbol(a^.HD);
		end;
	end;
	
	procedure insertarOrdenado (var L : lista; pV: polizaVector);
	var
		nuevo, ant, act : lista;
	begin
		new (nuevo);
		nuevo^.dato := pV;
		act := L;
		while (act <> NIL) and (act^.dato.dni < pV.dni) do begin
			ant := act;
			act := act^.sig;
		end;
		if (act = L) then 
			L := nuevo
		else
			ant^.sig := nuevo;
			nuevo^.sig := act;
	end;
	
	procedure inicializarVector (var v: vAnios);
	var
		i: integer;
	begin
		for i:= ext1 to ext2 do begin
			v[i]:= nil;
		end;
	end;
	
	procedure agregarVector (var v: vAnios; p: poliza);
	var
		pV: polizaVector;
	begin
		pV.dni:= p.dni;
		pV.suma:= p.suma;
		pV.valor:= p.valor;
		insertarOrdenado(v[p.fecha], pV);
	end;
	
	procedure generarVector (var v: vAnios; a: arbol; valor: integer; var dimL: integer);
	begin
		inicializarVector(v);
		if (a <> nil) then begin
			if (a^.dato.suma < valor) then begin
				if (v[a^.dato.fecha] = nil) then dimL:= dimL + 1;
				agregarVector(v,a^.dato);
			end;
			generarVector(v, a^.HI, valor, dimL);
			generarVector(v, a^.HD, valor, dimL);
		end;
	end;
	
	procedure imprimirVector (var v: vAnios; dimL: integer);
	var
		i: integer;
	begin
		for i:= ext1 to dimL do begin
			while (v[i] <> nil) do begin
				writeln('DNI: ',v[i]^.dato.dni);
				writeln('SUMA ASEGURADA: ',v[i]^.dato.suma);
				writeln('VALOR COUTA: ',v[i]^.dato.valor);
			end;
		end;
	end;
	
	function recorrerListaYBuscar (l: lista; dni: integer): integer;
	begin
		recorrerListaYBuscar:= 0;
		while (l <> nil) do begin
			if (l^.dato.dni = dni) then recorrerListaYBuscar:= recorrerListaYBuscar + 1;
			l:= l^.sig;
		end;
	end;
	
	procedure retornarPolizas(var v: vAnios; dni: integer; dimL: integer; var cantPolizas: integer);
	var
		i: integer;
	begin
		cantPolizas:= 0;
		for i:= ext1 to dimL do begin
			cantPolizas:= cantPolizas + recorrerListaYBuscar(v[i], dni);
		end;
	end;
	
var
	a: arbol;
	v: vAnios;
	valor, dimL, dni, cantPolizas: integer;
begin
	a:= nil;
	dimL:= 0;
	/// INCISO A
	writeln('----------------');
	generarArbol(a);
	imprimirArbol(a);
	writeln('----------------');
	/// INCISO B
	writeln('Ingrese un valor para generar el vector: ');
	readln(valor);
	inicializarVector(v);
	generarVector(v,a,valor, dimL);
	writeln('Vector generado con polizas menores a ',valor);
	imprimirVector(v, dimL);
	/// INCISO C
	writeln('Ingrese un DNI a buscar en el vector: ');
	readln(dni);
	retornarPolizas(v,dni,dimL,cantPolizas);
	writeln('La cantidad de polizas del dni ingresado es: ',cantPolizas);
end.
