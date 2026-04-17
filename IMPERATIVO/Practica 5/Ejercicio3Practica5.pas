{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

b) Implementar un módulo que reciba la estrucctura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}

program ejercicio3practica5;

type

	rangoRubros = 1..10;

	producto = record
		cod: integer;
		rubro: rangoRubros;
		stock: integer;
		precioUnitario: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vRubros = array [rangoRubros] of arbol;
	
	regMaximos = record
		cod: integer;
		stock: integer;
	end;
	
	vMaximos = array [rangoRubros] of regMaximos;
	
	vMaximos2 = array [rangoRubros] of integer;
	
	procedure inicializarVector (var v: vRubros);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			v[i]:= nil;
		end;
	end;
	
	procedure leerProducto (var p: producto);
	begin
		writeln('Ingrese el codigo de producto: ');
		readln(p.cod);
		if (p.cod <> 0) then begin
			writeln('Ingrese el numero de rubro al que pertenece (1-18): ');
			readln(p.rubro);
			writeln('Ingrese el stock del producto: ');
			readln(p.stock);
			writeln('Ingrese el precio por unidad: ');
			readln(p.precioUnitario);
		end;
	end;
	
	procedure agregarArbol (var a: arbol; p: producto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (a^.dato.cod > p.cod) then
				agregarArbol (a^.HI, p)
			else
				agregarArbol (a^.HD, p);
		end;
	end;
	
	procedure cargarVector (var v: vRubros);
	var
		p: producto;
	begin
		leerProducto(p);
		while (p.cod <> 0) do begin
			agregarArbol(v[p.rubro], p);
			leerProducto(p);
		end;
	end;
	
	function buscarCodigo (a: arbol; cod: integer): boolean;
	begin
		if (a = nil) then begin
			buscarCodigo:= false;
		end
		else begin
			if (a^.dato.cod = cod) then begin
				buscarCodigo:= true;
			end
			else
				if (a^.dato.cod > cod) then
					buscarCodigo:= buscarCodigo (a^.HI,cod)
				else
					buscarCodigo:= buscarCodigo (a^.HD,cod);
		end;
	end;
	
	function retornarSiEsta (v: vRubros; cod: integer; rubro: rangoRubros): boolean;
	begin
		retornarSiEsta:= buscarCodigo(v[rubro], cod);
	end;
	
	procedure retornarMaxCodeYStock (a: arbol; var maxC: integer; var maxS: integer);
	begin
		if (a = nil) then begin
			maxC:= -1;
			maxS:= -1;
		end
		else begin
			if (a^.HD = nil) then begin
				maxC:= a^.dato.cod;
				maxS:= a^.dato.stock;
			end
			else
				retornarMaxCodeYStock (a^.HD, maxC, maxS);
		end;
	end;
	
	procedure retornarMayorCode (v: vRubros; var vM: vMaximos);
	var
		i: integer;
		maxCode: integer;
		maxStock: integer;
		reg: regMaximos;
	begin
		for i:= 1 to 10 do begin
			retornarMaxCodeYStock (v[i], maxCode, maxStock);
			reg.cod:= maxCode;
			reg.stock:= maxStock;
			vM[i]:= reg;
		end;
	end;
	
	function retornarCantArbol (a: arbol; valor1: integer; valor2: integer): integer;
	begin
		if (a = nil) then begin
			retornarCantArbol:= 0;
		end
		else
			if (a^.dato.cod >= valor1) and (a^.dato.cod <= valor2) then begin
				retornarCantArbol:= 1 + retornarCantArbol(a^.HI, valor1, valor2) + retornarCantArbol(a^.HD, valor1, valor2);
			end
			else
				if (a^.dato.cod < valor1) then
					retornarCantArbol:= retornarCantArbol(a^.HD, valor1, valor2)
				else
					retornarCantArbol:= retornarCantArbol(a^.HI, valor1, valor2);
	end;
	
	procedure retornarCantEntreDos (v: vRubros; valor1: integer; valor2: integer; var vM: vMaximos2);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			vM[i]:= retornarCantArbol (v[i], valor1, valor2);
		end;
	end;
	
	
var
	v: vRubros;
begin
	inicializarVector(v);
	cargarVector(v);
end.
