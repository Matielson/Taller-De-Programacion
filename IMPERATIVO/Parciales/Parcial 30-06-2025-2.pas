{Correo Argentino desea analizar la información de los paquetes enviados durante 2024.
De cada paquete enviado se conoce: código de envío, tipo de envío (1..4), DNI del emisor, DNI del receptor y su peso en gramos.
Realice un programa que contenga e invoque a:
a. Un módulo que lea la información de paquetes enviados y retorne una estructura que agrupe los paquetes enviados según el tipo de envío. Para cada tipo de envío, se requiere que la búsqueda por peso en gramos sea lo más eficiente posible. La lectura finaliza al leer un paquete con código de envío 0.
b. Un módulo que reciba la estructura generada en a), un tipo de envío X, y retorne toda la información del paquete con mayor peso del tipo de envío X.
c. Un módulo que reciba la estructura generada en a), un tipo de envío X y un DNI D, y retorne la cantidad total de paquetes enviados por el emisor con DNI D, bajo el tipo de envío X.
}

program parcial30062025;

type

	rangoEnvios = 1..4;

	paquete = record
		codEnvio: integer;
		tipoEnvio: rangoEnvios;
		dniE: integer;
		dniR: integer;
		peso: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: paquete;
		HI: arbol;
		HD: arbol;
	end;
	
	vEnvios = array [rangoEnvios] of arbol;
	
	procedure leerPaquete (var p: paquete);
	begin
		p.codEnvio:= Random(101);
		if (p.codEnvio <> 0) then begin
			p.tipoEnvio:= 1 + Random(4);
			p.dniE:= 9 + Random(50);
			p.dniR:= 6 + Random(50);
			p.peso:= 100 + Random(1000);
		end;
	end;
	
	/// INCISO A
	
	procedure inicializarVector (var v: vEnvios);
	var
		i: integer;
	begin
		for i:= 1 to 4 do begin
			v[i]:= nil;
		end;
	end;
	
	procedure agregarArbol (var a: arbol; p: paquete);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.dato.peso > p.peso) then
				agregarArbol (a^.HI, p)
			else
				agregarArbol (a^.HD, p);
	end;
	
	procedure cargarVector (var v: vEnvios);
	var
		p: paquete;
	begin
		leerPaquete(p);
		while (p.codEnvio <> 0) do begin
			agregarArbol(v[p.tipoEnvio],p);
			leerPaquete(p);
		end;
	end;
	
	/// INCISO B
	
	procedure devolverMayorArbol (a: arbol; var p: paquete);
	begin
		if (a^.HD = nil) then begin
			p:= a^.dato;
		end
		else
			devolverMayorArbol(a^.HD, p);
	end;
	
	procedure devolverPaqueteMayorPeso (v: vEnvios; envio: integer; var p: paquete);
	begin
		if (v[envio] = nil) then
			writeln('No hay paquetes registrados para el tipo de envio ingresado.')
		else
			devolverMayorArbol(v[envio], p);
	end;
	
	/// INCISO C
	
	function devolverCantArbol (a: arbol; dni: integer): integer;
	begin
		if (a = nil) then begin
			devolverCantArbol:= 0;
		end
		else
			if (a^.dato.dniE = dni) then
				devolverCantArbol:= 1 + devolverCantArbol(a^.HI, dni) + devolverCantArbol(a^.HD, dni)
			else
				devolverCantArbol:= devolverCantArbol(a^.HI, dni) + devolverCantArbol(a^.HD, dni)
	end;
	
	function devolverCantPaquetes (v: vEnvios; envio: integer; dni: integer): integer;
	begin
		devolverCantPaquetes:= devolverCantArbol(v[envio], dni);
	end;

var
	v: vEnvios;
	p: paquete;
	envio, dni: integer;
begin
	inicializarVector(v);
	cargarVector(v);
	
	writeln('Ingrese un tipo de envio (1-4): ');
	readln(envio);
	devolverPaqueteMayorPeso(v,envio,p);
	
	writeln('Ingrese un tipo de envio (1-4): ');
	readln(envio);
	writeln('Ingrese un DNI de Emisor: ');
	readln(dni);
	writeln('La cantidad de paquetes registrados para el dni ingresado bajo el tipo de envio ingresado es: ', devolverCantPaquetes(v,envio,dni));
end.
