{
Correo Argentino desea analizar la información de los paquetes enviados durante 2024. De cada paquete enviado se conoce:
- código de envío
- DNI del emisor
- DNI del receptor
- cantidad de objetos en el paquete
- peso del paquete en gramos
Realice un programa que contenga e invoque a:
a. Un módulo que lea la información de paquetes enviados y retorne una estructura con todos los paquetes leídos.
La estructura debe ser eficiente para buscar por peso del paquete en gramos. 
La lectura finaliza al leer un paquete con código de envío 0.

b. Un módulo que reciba la estructura generada en a) y dos valores, y retorne una lista con todos los paquetes enviados 
cuyo peso está entre los dos valores recibidos.

c. Un módulo que reciba la estructura generada en a) y retorne toda la información del paquete enviado con mayor cantidad de objetos
}

program final07042025;

type

	paquete = record
		cod: integer;
		dniE: integer;
		dniR: integer;
		cantObjetos: integer;
		peso: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: paquete;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: paquete;
		sig: lista;
	end;
	
	procedure leerPaquete (var p: paquete);
	begin
		readln(p.cod);
		if (p.cod <> 0) then begin
			readln(p.dniE);
			readln(p.dniR);
			readln(p.cantObjetos);
			readln(p.peso);
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
		else begin
			if (a^.dato.peso > p.peso) then
				agregarArbol(a^.HI, p)
			else
				agregarArbol(a^.HD, p);
		end;
	end;
	
	procedure cargarArbol (var a: arbol);
	var
		p: paquete;
	begin
		leerPaquete(p);
		while (p.cod <> 0) do begin
			agregarArbol(a,p);
			leerPaquete(p);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; p: paquete);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure devolverLista (a: arbol; valor1: integer; valor2: integer; var l: lista);
	begin
		if (a <> nil) then begin
			if (a^.dato.peso >= valor1) and (a^.dato.peso <= valor2) then begin
				agregarAdelante(l,a^.dato);
				devolverLista(a^.HI, valor1, valor2, l);
				devolverLista(a^.HD, valor1, valor2, l);
			end
			else
				if (a^.dato.peso < valor1) then
					devolverLista (a^.HD, valor1, valor2, l)
				else
					devolverLista (a^.HI, valor1, valor2, l);
		end;
	end;
	
	procedure retornarMaxPaquete (a: arbol; var p: paquete; var max: integer);
	begin
		if (a <> nil) then begin
			retornarMaxPaquete (a^.HI, p, max);
			if (a^.dato.cantObjetos > max) then begin
				max:= a^.dato.cantObjetos;
				p:= a^.dato;
			end;
			retornarMaxPaquete (a^.HD, p, max);
		end;
	end;
	
	

var
	a: arbol;
	p: paquete;
	max, valor1, valor2: integer;
	l: lista;
begin
	a:= nil;
	l:= nil;
	cargarArbol(a);
	readln(valor1);
	readln(valor2);
	devolverLista(a,valor1,valor2,l);
	max:= -1;
	retornarMaxPaquete(a,p,max);
end.
