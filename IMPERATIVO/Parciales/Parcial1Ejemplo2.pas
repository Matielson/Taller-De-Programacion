program gork;

type

	sucursales = 1..10;

	venta = record
		dni: integer;
		codS: sucursales;
		numF: integer;
		monto: real;
	end;
	
	ventaLista = record
		numF: integer;
		monto: real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: ventaLista;
		sig: lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dni: integer;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	vSucursales = array [sucursales] of integer;
	
	procedure leerVenta (var v: venta);
	begin
		writeln('Ingrese el DNI del cliente: ');
		readln(v.dni);
		if (v.dni <> 0) then begin
			writeln('Ingrese el codigo de la sucursal: ');
			readln(v.codS);
			writeln('Ingrese el numero de factura: ');
			readln(v.numF);
			writeln('Ingrese el monto: ');
			readln(v.monto);
		end;
	end;
	
	procedure agregarAdelante(var l: lista; vL: ventaLista);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= vL;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure insertarArbol(var a: arbol; v: venta);
	var
		vL: ventaLista;
	begin
		if (a = nil) then begin
			new(a);
			a^.dni:= v.dni;
			a^.dato:= nil;
			vL.numF:= v.numF;
			vL.monto:= v.monto;
			agregarAdelante(a^.dato,vL);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.dni = v.dni) then begin
				vL.numF:= v.numF;
				vL.monto:= v.monto;
				agregarAdelante(a^.dato,vL);
			end
			else
				if (v.dni < a^.dni) then insertarArbol(a^.HI,v)
				else insertarArbol(a^.HD,v);
	end;
	
	procedure inicializarVector (var v: vSucursales);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			v[i]:= 0;
		end;
	end;
	
	procedure generarArbolyVector(var a: arbol; var vec: vSucursales);
	var
		v: venta;
	begin
		leerVenta(v);
		while (v.dni <> 0) do begin
			insertarArbol(a,v);
			vec[v.codS]:= vec[v.codS] + 1;
			leerVenta(v);
		end;
	end;
	
	procedure imprimirVenta (var vL: ventaLista);
	begin
		writeln('El numero de factura es: ',vL.numF);
		writeln('El monto es: ',vL.monto);
	end;
	
	procedure imprimirArbol(var a: arbol);
	begin
		if (a <> nil) then begin
			imprimirVenta(a^.dato^.dato);
			imprimirArbol(a^.HI);
			imprimirArbol(a^.HD);
		end;
	end;
	
	function recorrerListaYContar(l: lista; monto: integer): integer;
	begin
		recorrerListaYContar:= 0;
		while (l <> nil) do begin
			if (l^.dato.monto > monto) then recorrerListaYContar:= recorrerListaYContar + 1;
		end;
	end;
	
	function retornarFacturaPorDni(a: arbol; monto: integer; dni: integer): integer;
	begin
		if (a = nil) then begin
			retornarFacturaPorDni:= 0;
			writeln('No se encontro una factura con el DNI solicitado o el sistema esta vacio.');
		end
		else 
			if (a^.dni = dni) then begin
				retornarFacturaPorDni:= retornarFacturaPorDni + recorrerListaYContar(a^.dato, monto);
			end
			else
				if (dni < a^.dni) then retornarFacturaPorDni:= retornarFacturaPorDni(a^.HI,monto,dni)
				else retornarFacturaPorDni:= retornarFacturaPorDni(a^.HD,monto,dni);
	end;
	
	function retornarCodigoMayor (v: vSucursales; i: integer): integer
	begin
		if (i = 10) then begin
			retornarCodigoMayor:= v[i];
		end
		else begin
			maxResto:= retornarCodigoMayor(v,i+1);
			if (v[i] > maxResto) then
				retornarCodigoMayor:= v[i];
			else
				retornarCodigoMayor:= maxResto;
		end;
	end;
	
var
	a: arbol;
	v: vSucursales;
	dni, monto: integer;
begin
	a:= nil;
	/// INCISO A
	inicializarVector(v);
	writeln('Vector inicializado.');
	generarArbolyVector(a,v);
	writeln('Arbol generado.');
	writeln('Vector generado.');
	imprimirArbol(a);
	/// INCISO B
	writeln('Ingrese un DNI a buscar en el sistema: ');
	readln(dni);
	writeln('Ingrese un monto: ');
	readln(monto);
	writeln('La cantidad de facturas cuyo monto es superior a ',monto,'para el DNI ',dni,'es: ',retornarFacturaPorDni(a,monto,dni));
	/// INCISO C
	retornarCodigoMayor:= 0;
	writeln('El codigo de sucursal con mayor cantidad de ventas es: ', retornarCodigoMayor(v,1)); 
end.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
