program ejercicio1practica2;

const

	dimF = 15;

type

	vector = array [1..dimF] of integer;

	/// INCISO A

	procedure retornarVector (var v: vector; var dimL: integer);
	var
		num: integer;
	begin
		if (dimL < dimF) then begin
			num:= Random(155-10+1) + 10;
			if (num <> 20) then begin
				dimL:= dimL + 1;
				v[dimL]:= num;
				retornarVector(v,dimL);
			end;
		end;
	end;
	
	/// INCISO B
	
	procedure imprimirVectorIterativo (v: vector; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln(v[i]);
		end;
	end;
	
	/// INCISO C
	
	procedure imprimirVectorRecursivo (v: vector; dimL: integer; i: integer);
	begin
		if (i <= dimL) then begin
			writeln(v[i]);
			imprimirVectorRecursivo(v,dimL,i+1);
		end;
	end;
	
	/// INCISO D
	
	function devolverSumaVector (v: vector; dimL: integer; i: integer): integer;
	begin
		if (i > dimL) then begin
			devolverSumaVector:= 0;
		end
		else
			devolverSumaVector:= v[i] + devolverSumaVector(v,dimL,i+1); 
	end;
	
	/// INCISO E
	
	function maxVector (v: vector; dimL, i: integer): integer;
	var
		maxResto: integer;
	begin
		if (i = dimL) then
			maxVector := v[i]
		else begin
			maxResto := maxVector(v, dimL, i + 1);
			if (v[i] > maxResto) then
				maxVector := v[i]
			else
				maxVector := maxResto;
		end;
	end;
	
	/// INCISO F
	
	function devolverSiEsta (v: vector): boolean;
	
var

begin

end.

