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
		compras: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	vSucursales = array [sucursales] of integer;
	
	procedure leerVenta(var v: venta);
	begin
		writeln('Ingrese DNI (0 para cortar): '); readln(v.dni);
		if (v.dni <> 0) then begin
			writeln('Sucursal (1..10): '); readln(v.codS);
			writeln('Numero de factura: '); readln(v.numF);
			writeln('Monto: '); readln(v.monto);
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
	
	procedure insertarArbol(var ar: arbol; v: venta);
	var
		vL: ventaLista;
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dni:= v.dni;
			ar^.compras:= nil;
			vL.numF:= v.numF;
			vL.monto:= v.monto;
			agregarAdelante(ar^.compras, vL);
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (ar^.dni = v.dni) then begin
				vL.numF:= v.numF;
				vL.monto:= v.monto;
				agregarAdelante(ar^.compras,vL);
			end
			else
				if (v.dni < ar^.dni) then insertarArbol (ar^.HI,v)
				else insertarArbol(ar^.HD,v);
	end;
	
	procedure inicializarVector(var v: vSucursales);
	var 
		i: integer;
	begin
		for i := 1 to 10 do begin
			v[i] := 0;
		end;
	end;
	
	procedure generarArbolyVector (var ar: arbol; var vec: vSucursales);
	var
		v: venta;
	begin
		leerVenta(v);
		while (v.dni <> 0) do begin
			insertarArbol(ar,v);
			vec[v.codS]:= vec[v.codS] + 1;
			leerVenta(v);
		end;
	end;
	
	function recorrerListaYContar(l: lista; monto: real): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.monto < monto) then begin
				cant:= cant + 1;
			end;
			l:= l^.sig;
		end;
		recorrerListaYContar:= cant;
	end;
	
	function retornarFacturaPorDni(ar: arbol; monto: real; dni: integer): integer;
	begin
		if (ar = nil) then begin
			retornarFacturaPorDni:= 0;
		end
		else
			if (ar^.dni = dni) then begin
				retornarFacturaPorDni:= recorrerListaYContar(ar^.compras, monto);
			end
			else
				if (dni < ar^.dni) then retornarFacturaPorDni:= retornarFacturaPorDni(ar^.HI,monto,dni)
				else retornarFacturaPorDni:= retornarFacturaPorDni(ar^.HD,monto,dni);
	end;
	
	function encontrarValor (v: vSucursales; valor: integer): boolean;
	var
		existe: boolean;
		i: integer;
	begin
		i:= 1;
		existe:= false;
		while (not existe) and (i <= 10) do begin
			if (v[i] = valor) then begin
				existe:= true;
			end;
			i:= i + 1;
		end;
		encontrarValor:= existe;
	end;
	
	procedure imprimirLista(L: lista);
	begin
		while (L <> nil) do begin
			writeln('Factura: ', L^.dato.numF, '  Monto: ', L^.dato.monto:0:2);
			L := L^.sig;
		end;
	end;
	
	procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			writeln('DNI: ', a^.dni);
			imprimirLista(a^.compras);
			imprimirArbol(a^.HD);
		end;
	end;
	
	procedure imprimirVector(v: vSucursales);
	var 
		i: integer;
	begin
		writeln('--- Ventas por sucursal ---');
		for i := 1 to 10 do begin
			writeln('Sucursal ', i, ': ', v[i], ' ventas');
		end;
	end;
	
var
  ar: arbol;
  vec: vSucursales;
  monto: real;
  dni, valor: integer;
begin
  ar := nil;
  inicializarVector(vec);

  writeln('--- CARGA DE DATOS ---');
  generarArbolyVector(ar, vec);

  writeln;
  writeln('--- IMPRESION DE DATOS ---');
  writeln('Listado de clientes (inorden, por DNI): ');
  imprimirArbol(ar);

  writeln;
  writeln('Ventas por sucursal: ');
  imprimirVector(vec);

  writeln;
  writeln('--- INCISO B ---');
  write('Ingrese un monto a comparar: '); readln(monto);
  write('Ingrese un DNI a buscar: '); readln(dni);
  if (ar <> nil) then writeln('Cantidad de facturas menores a ', monto:0:2, ' para el DNI ', dni, ': ', retornarFacturaPorDni(ar, monto, dni));

  writeln;
  writeln('--- INCISO C ---');
  write('Ingrese un valor para buscar en el vector de sucursales: '); readln(valor);
  if (encontrarValor(vec, valor)) then
    writeln('El valor ', valor, ' SI se encontro en el vector.')
  else
    writeln('El valor ', valor, ' NO se encontro en el vector.');

  writeln;
  writeln('--- FIN DEL PROGRAMA ---');
  readln;
end.
