program ejercicio4Practica2;

	procedure imprimirBinario (num: integer);
	var
		bit: integer;
	begin
		if (num > 0) then begin
			bit:= num MOD 2;
			imprimirBinario(num DIV 2);
			write(bit);
		end;
	end;

var
	num: integer;
begin
	num:= 0;
	while (num <> -1) do begin
		writeln('Ingrese un numero para pasar a binario (-1 para cortar): ');
		read(num);
		imprimirBinario(num);
		writeln;
	end;
	writeln('-----------------');
	writeln('Fin de ejecucion.');
	writeln('-----------------');
end.
