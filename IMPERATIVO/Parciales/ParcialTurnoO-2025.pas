{MrStore requiere procesar las compras realizadas por sus clientes durante el año 2024.
a) Implementar un módulo que lea compras de productos. De cada compra se lee código del producto, código de cliente, día y mes. La lectura finaliza con el código de cliente 0. Se sugiere utilizar el módulo leerCompra(). El módulo debe retornar un vector donde se almacenen las compras agrupadas por mes. Las compras de cada mes deben quedar almacenadas en un árbol binario de búsqueda ordenado por código de producto.
b) Implementar un módulo recursivo que reciba el vector generado en a) y retorne el mes con mayor cantidad de compras.
c) Implementar un módulo que reciba el vector generado en a), un número de mes y un código de producto, y retorne si fue comprado o no el producto ingresado en el mes recibido.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}

program parcialTurnoO2025;

type
	
	rangoMeses = 1..12;
	rangoDias = 1..31;

	compra = record
		codP: integer;
		codC: integer;
		dia: rangoDias;
		mes: rangoMeses;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: compra;
		HI: arbol;
		HD: arbol;
	end;
	
	vMeses = array [rangoMeses] of arbol;
	
	procedure leerCompra (var c: compra);
	begin
		c.codC:= Random(200);
		if (c.codC <> 0) then begin
			c.codP:= Random(200) + 1;
			c.dia:= Random(31) + 1;
			c.mes:= Random(12) + 1;
		end;
	end;
	
	procedure inicializarVector (var v: vMeses);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			v[i]:= nil;
		end;
	end;
	
	procedure agregarArbol (var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= c;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (a^.dato.codP > c.codP) then
				agregarArbol(a^.HI, c)
			else
				agregarArbol(a^.HD, c);
		end;
	end; 
	
	procedure cargarVector (var v: vMeses);
	var
		c: compra;
	begin
		leerCompra(c);
		while (c.codC <> 0) do begin
			agregarArbol(v[c.mes], c);
			leerCompra(c);
		end;
	end;
	
	function contarCompras (a: arbol): integer;
	begin
		if (a = nil) then
			contarCompras:= 0
		else
			contarCompras:= 1 + contarCompras (a^.HI) + contarCompras (a^.HD);
	end;
	
	function mesMaxRec(v: vMeses; i: integer; mesMax: integer; max: integer): integer;
	var
		cant: integer;
	begin
		if (i > 12) then
			mesMaxRec := mesMax
		else begin
			cant := contarCompras(v[i]);
			
			if (cant > max) then
				mesMaxRec := mesMaxRec(v, i + 1, i, cant)
			else
				mesMaxRec := mesMaxRec(v, i + 1, mesMax, max);
		end;
	end;
	
	function estaEnArbol (a: arbol; cod: integer): boolean;
	begin
		if (a = nil) then begin
			estaEnArbol:= false;
		end
		else
			if (a^.dato.codP = cod) then begin
				estaEnArbol:= true;
			end
			else
				if (a^.dato.codP > cod) then
					estaEnArbol:= estaEnArbol(a^.HI, cod);
				else
					estaEnArbol:= estaEnArbol(a^.HD, cod);
	end;
	
	function fueComprado (v: vMeses; mes: integer; cod: integer): boolean;
	begin
		fueComprado:= estaEnArbol(v[mes],cod);
	end;
	
	
var

begin

end.
