program gork;

const
	anio = 2023;
type

	compra = record
		codV: integer;
		codC: integer;
		mes: string;
	end;
	
	compraNueva = record
		codC: integer;
		mes: string;
	end;
	
	lista = ^nodoLista
	
	nodoLista = record
		dato: compraNueva;
		sig: lista;
	end;
	
	arbol = ^nodoArbol
	
	nodoArbol = record
		codV: integer;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;

	procedure leerCompra (var c : compra);
	begin
		c.codC := Random(200);
		if (c.codC <> 0)then begin
			c.mes := Random(12) + 1;
			c.codV := Random(200) + 1000;
		end;
	end;
	
	procedure agregarAdelante(var l: lista, cn: compraNueva);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= cn;
		nue^.sig:=l;
		l:= nue;
	end;
	
	procedure insertarArbol (var ar: arbol, c: compra);
	var
		cn: compraNueva;
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.codV:= c.codV;
			ar^.dato:= nil;
			cn.codC:= c.codC;
			cn.mes:= c.mes;
			agregarAdelante(ar^.dato,cn);
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else begin
			if (ar^.codV = c.codV) then begin
				cn.codC:= c.codC;
				cn.mes:= c.mes;
				agregarAdelante(ar^.dato,cn);
			end
			else begin
				if (c.codV < ar^.codV) then insertarArbol(ar^.HI,c);
				else insertarArbol(ar^.HD,c);
			end;
		end;
	end;
	
	procedure generarArbol (var ar: arbol);
	var
		c: compra;
	begin
		leerCompra(c);
		while (c.codC <> 0) do begin
			insertarArbol(ar,c);
			leerCompra(c);
		end;
	end;
	
	procedure retornarComprasJuego (var ar: arbol, codigo: integer, var l: lista);
	begin
		if (ar = nil) then begin
			writeln('No se encontro el videojuego solicitado o no hay ventas.');
		end
		else begin
			if (ar^.codV = codigo) then begin
				l:= ar^.dato;
			end
			else begin
				if (codigo < ar^.codV) then retornarComprasJuego(ar^.HI,codigo,l);
				else retornarComprasJuego(ar^.HD,codigo,l);
			end;
		end;
	end;
	
	procedure retornarClientesMes (l: lista, mes: string, var cantTotal: integer);
	begin
		if (l <> nil) then begin
			cantTotal:= cantTotal + 1;
			retornarClientesMes(l^.sig,mes,cantTotal);
		end;
	end;
	
var
	ar: arbol;
	l: lista;
	codigo, cantTotal: integer;
	mes: string;
begin
	/// INCISO A 
	generarArbol(ar);
	writeln('Un arbol fue generado.');
	/// INCISO B
	writeln('Ingrese un codigo de videojuego a buscar: ');
	readln(codigo);
	retornarComprasJuego(ar,codigo,l);
	if (ar <> nil) then writeln('El codigo de videojuego ingresado, fue encontrado.');
	/// INCISO C
	writeln('Ingrese un mes a buscar: ');
	readln(mes);
	retornarClientesMes(l,mes,cantTotal);
	if (l <> nil) then writeln('El mes ingresado, fue encontrado. La cantidad de clientes que compraron en el mes de', mes 'fue de', cantTotal);
end;
