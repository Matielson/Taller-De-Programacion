program ejercicio2practica1;

const

type

	oficina = record
		codI: integer;
		dni: integer;
		valor: real;
	end;
	
	vOficinas = array [1..300] of oficina;
	
	/// INCISO A
	
	procedure leerOficina (var o: oficina)
	begin
		readln(o.codI);
		if (o.codI <> - 1) then begin
			readln(o.dni);
			readln(o.valor);
		end;
	end;
	
	procedure cargarVector (var v: vOficinas; var dimL: integer)
	var
		o: oficina;
	begin
		leerOficina(o);
		while (o.codI <> -1) do begin
			dimL:= dimL + 1;
			v[dimL]:= o;
			leerOficina(o)
		end;
	end;
	
	/// INCISO B
	
	procedure ordenarInsercion (var v: vOficinas; dimL: integer);
	var
		i,j: integer;
		actual: oficina;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i - 1;
			while (j > 0) and (v[j].codI > actual.codI) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;	
	end;
	
	/// INCISO C
	
	procedure ordenarSeleccion (var v: vOficinas; dimL: integer);
	var
		i,j,pos: integer;
		item: oficina;
	begin
		for i:= 1 to dimL-1 do begin
			pos:= i;
			for j:= i+1 to dimL do begin
				if (v[j].codI < v[pos].codI) then pos:= j;
			end;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
		end;
	end;

var
	dimL: integer;
	v: vOficinas;
begin
	dimL:= 0;
	cargarVector(v, dimL);
end;

