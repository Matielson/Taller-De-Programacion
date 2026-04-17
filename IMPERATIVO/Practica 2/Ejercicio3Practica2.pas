program ejercicio3practica2;

const

	dimF = 20;
	max = 1550;
	min = 300;

type

	vector = array [1..dimF] of integer;
	
	procedure cargarVector (var v: vector; var dimL: integer);
	var
		num: integer;
	begin
		if (dimL < dimF) then begin
			v[dimL]:= Random(max-min+1) + min;
			dimL:= dimL + 1;
			cargarVector(v, dimL);
		end;
	end;
	
	procedure ordenarVectorSeleccion (var v: vector; dimL: integer);
	var
		i,j,pos: integer;
		item: integer;
	begin
		for i:= 1 to dimL-1 do begin
			pos:= i;
			for j:= i+1 to dimL do begin
				if (v[j] < v[pos]) then pos:= j;
			end;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
		end;
	end;
	
	procedure busquedaDicotomica (v: vector; ini, fin: integer; valor: integer; var pos: integer);
	var
		medio: integer;
	begin
		if (ini > fin) then pos:= -1
		else
			medio:= (ini + fin) DIV 2;
			if (v[medio] = valor) then
				pos:= medio
			else
				if (valor < v[medio]) then
					busquedaDicotomica(v,ini, medio-1,valor,pos)
				else
					busquedaDicotomica(v,medio+1, fin, valor, pos);
	end;
	

var
	v: vector;
	valor, pos: integer;
begin
	cargarVector(v);
	ordenarVectorSeleccion(v, dimL);
	writeln('Ingrese un numero a buscar en el vector: ');
	readln(valor);
	busquedaDicotomica(v,1,dimL,valor,pos);
end;
