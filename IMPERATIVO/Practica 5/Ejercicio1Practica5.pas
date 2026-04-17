{El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar
0. 
Luego el programa debe informar el DNI del propietario o un cartel indicando que
no se encontró la oficina.

d) Un módulo recursivo que retorne el monto total acumulado de las expensas. 
}

program ejercicio1practica5;

const

	dimF = 300;

type

	oficina = record
		cod: integer;
		dniPropietario: integer;
		valorExpensa: real;
	end;

	vOficinas = array [1..dimF] of oficina;
	
	procedure leerOficina (var o: oficina);
	begin
		writeln('Ingrese el codigo de identificacion de la oficina');
		readln(o.cod);
		if (o.cod <> 0) then begin
			writeln('Ingrese el DNI del propietario: ');
			readln(o.dniPropietario);
			writeln('Ingrese el valor de la expensa: ');
			readln(o.valorExpensa);
		end;
	end;
	
	procedure cargarVector (var v: vOficinas; var dimL: integer);
	var
		o: oficina;
	begin
		leerOficina(o);
		while (o.cod <> 0) and (dimL < dimF) do begin
			dimL:= dimL + 1;
			v[dimL]:= o;
			leerOficina(o);
		end;
	end;
	
	procedure ordenarVectorInserccion (var v: vOficinas; dimL: integer);
	var
		i,j: integer;
		actual: oficina;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i - 1;
			while (j > 0) and (v[j].cod > actual.cod) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	procedure busquedaDicotomica (v: vOficinas; ini, fin: integer; valor: integer; var pos: integer);
	var
		medio: integer;
	begin
		if (ini > fin) then pos:= 0
		else begin
			medio:= (ini + fin) DIV 2;
			if (v[medio].cod = valor) then
				pos:= medio
			else
				if (valor < v[medio].cod) then
					busquedaDicotomica(v,ini, medio-1,valor,pos)
				else
					busquedaDicotomica(v,medio+1, fin, valor, pos);
		end;
	end;
	
	function retornarValorExpensas (v: vOficinas; dimL: integer): real;
	begin
		if (dimL < 1) then begin
			retornarValorExpensas:= 0;
		end
		else
			retornarValorExpensas:= v[dimL].valorExpensa + retornarValorExpensas(v,dimL-1);
	end;
	
var
	v: vOficinas;
	dimL, pos, valor: integer;
begin
	dimL:= 0;
	cargarVector(v, dimL);
	ordenarVectorInserccion(v,dimL);
	
	writeln('Ingrese un valor a buscar en el sistema: ');
	readln(valor);
	
	busquedaDicotomica(v,1,dimL,valor,pos);
	if (pos = 0) then
		writeln('No se encontro el elemento en el sistema.')
	else
		writeln('Se encontro el valor ingresado, DNI: ', v[pos].dniPropietario);
end.
