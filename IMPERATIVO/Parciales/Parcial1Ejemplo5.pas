program gork;

const

	dimF = 5;

type

	entregas = 1..5;
	
	compra = record
		codComida: integer;
		codCliente: integer;
		cat: string;
	end;
	
	compraVector = record
		cantEntregas: integer;
		cat: string;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		codComida: integer;
		cantEntregas: integer;
		HI: arbol;
		HD: arbol;
	end;
	
	vEntregas = array [entregas] of compraVector;
	
	procedure leerCompra(var c:compra);
	var 
		v: array [1..5] of string = ('Full','Super','Media','Normal','Basica');
	begin
		c.codCliente:= random(200);
		if(c.codCliente <> 0) then begin
			c.cat:= v[random(5)+1];
			c.codComida:= random(200) + 1000;
		end;
	end;
	
	procedure insertarArbol(var ar: arbol; c: compra);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.codComida:= c.codComida;
			ar^.cantEntregas:= 1;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (ar^.codComida = c.codComida) then begin
				ar^.cantEntregas:= ar^.cantEntregas + 1;
			end
			else
				if (c.codComida < ar^.codComida) then insertarArbol(ar^.HI,c)
				else insertarArbol(ar^.HD,c);
	end;
	
	procedure inicializarVector (var v: vEntregas);
	var
		vN: array [1..5] of string = ('Full','Super','Media','Normal','Basica');
		i: integer;
	begin
		for i:= 1 to 5 do begin
			v[i].cantEntregas:= 0;
			v[i].cat:= vN[i];
		end;
	end;
	
	procedure agregarAlVector (var v: vEntregas; c: compra);
	var
		encontre: boolean;
		i: integer;
	begin
		encontre:= false;
		i:= 1;
		while (not encontre) do begin
			if (c.cat = v[i].cat) then begin
				encontre:= true;
				v[i].cantEntregas:= v[i].cantEntregas + 1;
			end
			else
				i:= i + 1;
		end;
	end;
	
	procedure generarArbolyVector(var ar: arbol; var v: vEntregas);
	var
		c: compra;
	begin
		leerCompra(c);
		while (c.codCliente <> 0) do begin
			insertarArbol(ar,c);
			agregarAlVector(v,c);
			leerCompra(c);
		end;
	end;
	
	function retornarEntregas (ar: arbol; cod: integer): integer;
	begin
		if (ar = nil) then begin
			retornarEntregas:= 0;
		end
		else
			if (ar^.codComida = cod) then begin
				retornarEntregas:= ar^.cantEntregas;
			end
			else
				if (cod < ar^.codComida) then retornarEntregas:= retornarEntregas(ar^.HI,cod)
				else retornarEntregas:= retornarEntregas(ar^.HD,cod);
	end;
	
	procedure ordenarInsercion (var v: vEntregas);
	var
		i,j: integer;
		actual: compraVector;
	begin
		for i:= 2 to 5 do begin
			actual:= v[i];
			j:= i - 1;
			while (j > 0) and (v[j].cantEntregas > actual.cantEntregas) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	procedure imprimirArbol (ar:arbol);
	begin
		if (ar <> nil) then begin
			imprimirArbol(ar^.HI);
			writeln('CODIGO COMIDA: ',ar^.codComida);
			writeln('CANTIDAD ENTREGAS: ',ar^.cantEntregas);
			writeln;
			imprimirArbol(ar^.HD);
		end;
	end;
	
	procedure imprimirVector (v: vEntregas);
	var
		i: integer;
	begin
		writeln('------- Cantidad de entregas por Categoria ------');
		for i:= 1 to 5 do begin
			writeln('Categoria ',v[i].cat, ': ', v[i].cantEntregas, ' entregas');
		end;
	end;
	
var
	ar: arbol;
	vec: vEntregas;
	cod: integer;
begin
	ar:= nil;
	randomize;
	inicializarVector(vec);
	writeln('------ CARGA DE DATOS ------');
	generarArbolyVector(ar,vec);
	
	writeln;
	writeln('------ IMPRESION DE DATOS ------');
	writeln('Listado de cantidad de entregas (inorden, por codComida): ');
	imprimirArbol(ar);
	
	writeln;
	writeln('Entregas por categoria ');
	imprimirVector(vec);
	
	writeln;
	writeln('------ INCISO B ------');
	writeln('Ingrese un codigo de comida a buscar: ');
	readln(cod);
	if (ar <> nil) then writeln('La cantidad de entregas realizadas para el codigo de comida ', cod, ' es: ', retornarEntregas(ar,cod))
	else writeln('El arbol esta vacio o no se encontro el codigo de comida solicitado.');
	
	writeln;
	writeln('------ INCISO C ------');
	ordenarInsercion(vec);
	writeln('Ordenando Vector y buscando la categoria con mas entregas...');
	writeln('Vector ordenado.');
	writeln('La categoria con mas cantidad de entregas es: ', vec[5].cat);
	
	writeln;
	writeln('------ FIN DEL PROGRAMA ------');
	readln;
end.
