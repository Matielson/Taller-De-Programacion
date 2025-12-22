program gork;

const
	dimF = 300;
type

	oficina = record
		cod: integer;
		dni: integer;
		valor: real;
	end;
	
	vOficinas = array [1..dimF] of oficina;
	
	procedure leerOficina (var o: oficina);
	begin
		readln(o.cod);
		readln(o.dni);
		readln(o.valor);
	end;
	
	procedure agregarVector(var v: vOficinas: var dimL: integer; o: oficina);
	begin
		v[dimL]:= o;
		dimL:= dimL + 1;
	end;
	
	procedure generarVector(var v: vOficinas; var dimL: integer);
	var
		o: oficina;
	begin
		dimL:= 1;
		leerOficina(o);
		while (o.cod <> 0) and (dimL <= dimF) do begin
			agregarVector(v,dimL,o);
			leerOficina(o);
		end;
	end;
	
	procedure ordenarVector(var v: vOficinas, dimL: integer);
	var
		i, j: integer; 
		actual: oficina;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i-1;
			while (j > 0) and (v[j] > actual.cod) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	procedure busquedaDicotomica (var v: vOficinas, cod: integer, var pos: integer);
	var
		i,j,medio: integer;
		encontre: boolean;
	begin
		i:= 1;
		j:= dimF;
		medio:= (j+i)DIV 2;
		encontre:= false;
		while (i <= j) and(not encontre) do begin
			if (v[medio] = cod) then begin
				encontre:= true;
				pos:= medio;
			end
			else
				if (v[medio] < cod) then begin
					i:= medio;
				end
				else
					j:= medio;
				end;
			end;
		end;
		if (not encontre) then pos:= 0;
	end;
	
	procedure totalExpensas (v: vOficinas; i, dimL: integer; var total: integer);
	begin
		if (i <= dimL) then begin
			total:= total + v[i].valor;
			totalExpensas(v,dimL,i+1,total);
		end;
	end;
	
var
	v: vOficinas;
	dimL,cod,pos,i,total: integer;
begin
	total:=0;
	generarVector(v,dimL);
	writeln('Vector Generado.');
	ordenarVector(v,dimL);
	writeln('Vector Ordenado.');
	writeln('Ingrese el codigo a buscar: ');
	readln(cod);
	busquedaDicotomica(v,cod, pos);
	writeln('El vector fue encontrado en la posicion: ', pos '(Devuelve 0 si no fue encontado.)');
	totalExpensas(v,i,dimL,total);
	writeln('El valor total de las expensas es: ', total);
end;
