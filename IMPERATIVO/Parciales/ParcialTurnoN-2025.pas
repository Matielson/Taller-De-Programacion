{Una empresa gastronómica requiere el procesamiento de las entregas de comida realizadas a sus clientes durante el mes de mayo de 2025.

a) Implementar un módulo que lea entregas de comidas. De cada compra se lee código de comida, código de cliente, día y categoría de la entrega (1 a 5). La lectura finaliza con el código de cliente 0. Se sugiere utilizar el módulo leerEntrega(). Se deben retornar 2 estructuras de datos:

i. Un árbol binario de búsqueda ordenado por código de comida. Para cada código de comida deben almacenarse las entregas realizadas a ese código.

ii. Un vector que almacene, para cada categoría, la cantidad de entregas realizadas.

b) Implementar un módulo que reciba el árbol generado en a) y dos códigos de comida y un valor entero. El módulo debe retornar la cantidad de entregas realizadas al cliente con dni igual al valor ingresado para comidas con códigos entre los dos códigos ingresados (sin incluir).

c) Implementar un módulo recursivo que reciba el vector generado en a)ii y un valor entero. El módulo debe retornar si existe o no una categoría con cantidad de entregas igual al valor ingresado.}


program parcialTurnoN;

type
    rangoCat = 1..5;

    compra = record
        codComida:integer;
        codCliente:integer;
        dia:integer;
        categoria:rangoCat;
    end;

    entrega = record
        codCliente:integer;
        dia:integer;
        categoria:rangoCat;
    end;

    lista = ^nodoLista;
    nodoLista = record
        dato:entrega;
        sig:lista;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        codComida :integer;
        dato:lista;
        HI:arbol;
        HD:arbol;
    end;

    vCategorias = array [1..5] of integer;

    procedure inicializarVector(var v: vCategorias);
    var
        i:integer;
    begin
        for i := 1 to 5 do begin
            v[i] := 0;
        end;
    end;

    procedure leerCompra (var c:compra);
    begin
        readln(c.codCliente);
        if (c.codCliente <> 0) then begin
            readln(c.codComida);
            readln(c.dia);
            readln(c.categoria);
        end;
    end;
    
    procedure agregarAdelante (var l: lista; c: compra);
    var
		nue: lista;
	begin
		new(nue);
		nue^.dato.codCliente:= c.codCliente;
		nue^.dato.dia:= c.dia;
		nue^.dato.categoria:= c.categoria;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure agregarArbol (var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= nil;
			agregarAdelante(a^.dato, c);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.codComida = c.codComida) then begin
				agregarAdelante(a^.dato,c);
			end
			else
				if (a^.codComida > c.codComida) then
					agregarArbol (a^.HI, c)
				else
					agregarArbol (a^.HD, c);
	end;
	
	procedure cargarArbolYVector (var a: arbol; var v: vCategorias);
	var
		c: compra;
	begin
		leerCompra(c);
		while (c.codCliente <> 0) do begin
			agregarArbol(a,c);
			v[c.categoria]:= v[c.categoria] + 1;
			leerCompra(c);
		end;
	end;
	
	function contarEnLista (l: lista; cod: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.codCliente = cod) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		contarEnLista:= cant;
	end;
	
	function retornarCantEntre (a: arbol; cod1: integer; cod2: integer; codC: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantEntre:= 0;
		end
		else
			if (a^.codComida > cod1) and (a^.codComida < cod2) then begin
				retornarCantEntre:= contarEnLista(a^.dato, codC) + retornarCantEntre(a^.HI, cod1, cod2, codC) + retornarCantEntre(a^.HD, cod1, cod2, codC);
			end
			else
				if (a^.codComida <= cod1) then
					retornarCantEntre:= retornarCantEntre (a^.HD, cod1, cod2, codC)
				else
					retornarCantEntre:= retornarCantEntre (a^.HI, cod1, cod2, codC); 
	end;
	
	function devolverSiEsta (v: vCategorias; valor: integer; i: integer): boolean;
	begin
		if (i > 5) then begin
			devolverSiEsta:= false;
		end
		else begin
			if (v[i] = valor) then begin
				devolverSiEsta:= true;
			end
			else
				devolverSiEsta:= devolverSiEsta(v, valor, i+1);
		end;
	end;
	
var
	a: arbol;
	v: vCategorias;
	cod1,cod2,codC,valor: integer;
begin
	a:= nil;
	inicializarVector(v);
	cargarArbolYVector(a, v);
	readln(cod1);
	readln(cod2);
	readln(codC);
	
	retornarCantEntre(a,cod1,cod2,codC);
	
	readln(valor);
	devolverSiEsta(v,valor,1);
end.
