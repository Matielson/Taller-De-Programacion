program Ejercicio1Practica5;
type
	
	cliente = record
		dni: integer;
		fecha: string;
		monto: real;
	end;

var
	c: cliente;
begin
	c.dni:= 5672;
	c.fecha:= 'Hoy';
	c.monto:= 200.4;
	readln(c);
end.































