program Ejercicio2;
const
	oficinas = 300;
type

	oficina = record;
		cod: integer;
		dni: integer;
		valE: real;
	end;

	oVector = array [1..oficinas] of oficina;
	
procedure leerOficina (var o: oficina);
begin
	writeln('Ingrese codigo de identificacion(-1 para finalizar): ');
	readln(v.cod);
	if (v.cod <> -1) then begin
		writeln('Ingrese el dni del propietario: ');
		readln(v.dni);
		writeln('Ingrese el valor de la expensa: ');
		readln(v.valE);
end;
	
	
procedure cargarVector (var v: oVector; var dimL);
var
	o: oficina;
begin
	leerOficina(o);
	while (dimL <= 300) and (v.cod <> -1) do begin
		v[dimL]:= o;
		dimL:= dimL + 1;
		leerOficina(o);
	end;
end;

procedure ordenarVectorInsercion (var v: oVector; dimL: integer );

var
i, j: integer; 
actual: oficina;
begin
    for i:= 2 to dimL do begin
        actual:= v[i];
        j:= i-1;
        while (j > 0) and (v[j].cod > actual.cod) do begin
            v[j+1]:= v[j];
            j:= j - 1;
        end;
        v[j+1]:= actual;
    end;
end;

procedure ordenarVectorSeleccion (var v: tVector; dimL: integer);

var
i, j, pos: integer; 
item: oficina;

begin
    // BUSCA EL MÍNIMO Y GUARDA EN POS LA POSICIÓN DEL MÍNIMO
    for i:= 1 to dimLog-1 do begin  
        pos:= i;
        for j:= i+1 to dimL do begin
            if (v[j].cod < v[pos].cod) then begin
                pos:= j;
            end;
            
            /// INTERCAMBIA v[i] (i = número de vuelta) y v[p]
            item:= v[pos];
            v[pos]:= v[i];
            v[i]:= item;
        end;
    end;
end;


var 
	v: oVector;
	dimL: integer;
begin
	cargarVector(v,dimL);
	ordenarVectorInsercion(v,dimL);
	ordenarVectorSeleccion(v,dimL);
end.
