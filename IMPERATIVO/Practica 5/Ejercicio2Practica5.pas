program gork;

const

type
	anios = 2015..2024
	
	auto = record
		patente: string;
		anio: anios;
		marca: string;
		color: string;
		modelo: string;
	end;
	
	autoNuevo = record
		pantente: string;
		color: string;
	end;
	
	arbol = ^nodoArbol
	
	nodoArbol = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista
	
	nodoLista = record
		dato: autoNuevo;
		sig: lista;
	end;
	
	arbol2 = ^nodoArbol2
	
	nodoArbol2 = record
		marca: string;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoListaAutos
	
	nodoListaAutos = record
		dato: auto;
		sig: lista;
	end;
	
	vAnios = array [anios] of listaAutos;
	
	procedure leerAuto(var au: auto);
	begin
		writeln('Ingrese la marca del vehiculo (MMM para terminar de ingresar vehiculos):');
		readln(au.marca);
		if (au.marca <> MMM) then begin
			writeln('Ingrese la patente del vehiculo:');
			readln(au.patente);
			writeln('Ingrese el año del vehiculo:');
			readln(au.anio);
			writeln('Ingrese el color del vehiculo:');
			readln(au.color);
			writeln('Ingrese el modelo del vehiculo:');
			readln(au.modelo);
		end;
	end;
	
	procedure insertarArbol (var ar: arbol, au: auto);
	var
	
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dato:= au;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (au.pantente < ar^.dato.patente) then insertarArbol(ar^.HI, au);
			else insertarArbol(ar^.HD, au) 
	end;
	
	procedure agregarAdelante (var l: lista, aun: autoNuevo);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= aun;
		nue^.sig:= l;
		l:= nuevo; 
	end;
	
	procedure insertarArbol2 (var ar2: arbol2, au: auto);
	var
		l: lista;
		aun: autoNuevo;
	begin
		if (ar2 = nil) then begin
			new(ar2);
			ar2^.marca:= au.marca;
			ar2^.dato:= nil;
			aun.patente:= au.patente;
			aun.color:= au.color;
			agregarAdelante(l, aun);
			ar2^.HI:= nil;
			ar2^.HD:= nil;
		end
		else
			if (ar2^.marca = au.marca) then begin
				aun.patente:= au.patente;
				aun.color:= au.color;
				agregarAdelante(ar2^.dato, aun);
			end
			else
				if (au.marca < ar2^.marca) then insertarArbol2(ar2^.HI, au);
				else insertarArbol2(ar2^.HD, au);
	end;
	
	procedure generarArboles (var ar: arbol, var ar2: arbol2);
	var
		au: auto;
		aun: autoNuevo;
	begin
		leerAuto(au);
		while (au.marca <> MMM) do begin
			insertarArbol(ar,au);
			insertarArbol2(ar2,aun);
			leerAuto(au);
		end;
	end;
	
	procedure contarAutosMarca (ar: arbol, marca: string, var cantAutos: integer);
	begin
		cantAutos:= 0;
		if (ar <> nil) then begin
			if (ar^.dato.marca = marca) then begin
				cantAutos:= cantAutos + 1;	
			end;
			contarAutosMarca (ar^.HI, marca, cantAutos);
			contarAutosMarca (ar^.HD, marca, cantAutos);
		end;
	end;
	
	procedure contarAutosMarca2 (ar2: arbol2, marca: string, var cantAutos: integer);
	begin
		cantAutos:= 0;
		if (ar2 = nil) then begin
			writeln('No se encontro la marca solicitada en la agencia.');
		end
		else
			if (ar2^.marca = marca) then begin
				cantAutos:= cantAutos + recorrerListaYContar(ar2^.dato);
			end
			else 
				if (marca < ar2^.marca) then contarAutosMarca2(ar2^.HI,marca,cantAutos);
				else contarAutosMarca2(ar2^.HD,marca,cantAutos);
			end;
		end;
	end;
	
	procedure agregarAutoVector(var v: vAnios, au: auto);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= au;
		nue^.sig:= v[au.anio];
		v[au.anio]:= nue;
	end;
	
	procedure agruparAutosPorAnio (var v: vAnios; ar: arbol);
	begin
		if (ar <> nil) then begin
			agregarAutoVector(v,ar.dato);
			agruparAutosPorAnio(v,ar^.HI);
			agruparAutosPorAnio(v,ar^.HD);
		end;
	end;
	
	function buscarModeloPorPatente (ar: arbol; patente: string): string;
	begin
		if (ar = nil) then begin
			writeln('La patente ingresada no se encuentra en la agencia o la agencia se encuentra vacia.');
		end
		else
			if (ar^.dato.patente = patente) then begin
				buscarModeloPorPatente:= ar^.dato.modelo;
			end
			else
				if (patente < ar^.dato.patente) then buscarModeloPorPatente:= buscarModeloPorPatente(ar^.HI,patente);
				else buscarModeloPorPatente:= buscarModeloPorPatente(ar^.HD,patente);
			end;
		end;
	end;
	
	function recorrerListaYBuscar(l: lista, patente: string): string;
	var
		encontre: boolean;
	begin
		encontre:= false;
		while (not encontre) and (l <> nil) do begin
			if (l^.dato.patente = patente) then begin
				encontre:= true;
				recorrerListaYBuscar:= l^.dato.color;
			end
			else
				l:= l^.sig;
		end;
		if (encontre = false) then recorrerListaYBuscar:= 'La patente solicitada no fue encontrada.';
	end;
	
	function buscarColorPorPatente (ar2: arbol2; patente: string): string;
	var
		resultado, msjError: string;
		
	begin
		msjError:= 'La patente solicitada no fue encontrada o la agencia esta vacia.'
		if (ar2 = nil) then begin
			buscarColorPorPatente := msjError;
		end
		else begin
			resultado := recorrerListaYBuscar(ar2^.dato, patente);
			if (resultado <> msjError) then begin
				buscarColorPorPatente := resultado;
			end
			else begin
				resultado := buscarColorPorPatente(ar2^.HI, patente);
				if (resultado <> msjError) then begin
					buscarColorPorPatente := resultado;
				end
				else begin
					buscarColorPorPatente := buscarColorPorPatente(ar2^.HD, patente);
				end;
			end;
		end;
	end;
	
var
	ar: arbol;
	ar2: arbol2;
	marca, patente, modeloEncontrado, colorEncontrado: string;
	cantAutos, cantAutosMarca: integer;
	v: vAnios;
begin
	/// INCISO A
	generarArboles(ar,ar2);
	writeln('Ambos arboles fueron generados.');
	writeln('----------------');
	/// INCISO B
	writeln('Ingrese una marca a buscar en el primer arbol:');
	readln(marca);
	contarAutosMarca(ar,marca,cantAutos);
	writeln('La cantidad total de autos que hay en la agencia para la marca', marca 'es:', cantAutos);
	writeln('----------------');
	/// INCISO C
	writeln('Ingrese una marca a buscar en el segundo arbol:');
	readln(marca);
	cantAutosMarca:= contarAutosMarca2(ar2,marca,cantAutos);
	if (ar2 <> nil) then writeln('La cantidad de autos en la agencia para la marca', marca 'en el segundo arbol es: ', cantAutosMarca);
	writeln('----------------');
	/// INCISO D
	agruparAutosPorAnio(v,ar);
	writeln('Un Vector fue creado. En cada posicion (2015-2024) encuentra la cantidad de autos en ese año.');
	writeln('----------------');
	/// INCISO E
	writeln('Ingrese una patente a buscar en la agencia (primer arbol): ');
	readln(patente);
	modeloEncontrado:= buscarModeloPorPatente(ar,patente);
	if (ar <> nil) then writeln('La patente ingresada se encontro en el modelo: ', modeloEncontrado);
	writeln('----------------');
	/// INCISO F
	writeln('Ingrese una patente a buscar en la agencia (segundo arbol): ');
	readln(patente);
	colorEncontrado:= buscarColorPorPatente(ar2,patente);
	if (ar2 <> nil) then writeln('La patente ingresada se encontro en un vehiculo con color: ', colorEncontrado);
	writeln('----------------');
	/// FIN
	writeln('PROGRAM GORK FINALIZADO.');
end;
