program Ejercicio3;
const
	ext1 = 300;
	ext2 = 1550;
	dimF = 20;
type
	
	vNumeros = array [1..dimF] of integer;
	
	procedure VeinteRandom (var v: vNumeros; pos: integer);
	begin
		if (pos <= dimF) then begin
			v[pos]:= random(ext2-ext1+1)+ext1;
			VeinteRandom(v, pos+1);
		end;
	end;
	
	procedure ordenarVectorSeleccion (var v: vNumeros; dimF: integer);
	var
	i, j, pos: integer; 
	item: integer;
	begin
		 // BUSCA EL MÍNIMO Y GUARDA EN POS LA POSICIÓN DEL MÍNIMO
		for i:= 1 to dimF-1 do begin  
			pos:= i;
			for j:= i+1 to dimF do 
				if (v[j] < v[pos]) then begin
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
	v: vNumeros;
	p: integer;
begin
	randomize;
	p:= 1;
	VeinteRandom(v,p);
end;
