{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
septiembre de 2025. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y
puntaje promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program ejercicio3;
type
	rangoGeneros = 1..8;

	pelicula = record
		codP: integer;
		codG: rangoGeneros;
		puntaje: real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: pelicula;
		sig: lista;
	end;
	
	vGeneros = array [rangoGeneros] of lista;
	
	vMaximos = array [rangoGeneros] of pelicula;
	
	/// INCISO A 
	
	procedure leerPelicula (var p: pelicula);
	begin
		writeln('Ingrese un codigo de pelicula (1-8): ');
		readln(p.codP);
		if (p.codP <> -1) then begin
			writeln('Ingrese un codigo de genero: ');
			readln(p.codG);
			writeln('Ingrese un puntaje: ');
			readln(p.puntaje);
		end;
	end;


	procedure inicializarVectorNil (var v: vGeneros);
	var
		i: integer;
	begin
		for i:= 1 to 8 do begin
			v[i]:= nil;
		end;
	end;
	
	procedure agregarAdelante (var l: lista; p: pelicula);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure cargarVector (var v: vGeneros);
	var
		p: pelicula;
	begin
		leerPelicula(p);
		while (p.codP <> -1) do begin
			agregarAdelante(v[p.codG], p);
			leerPelicula(p);
		end;
	end;
	
	/// INCISO B
	
	procedure retornarMaximoLista (l: lista; var p: pelicula);
	var
		max: real;
	begin
		max:= -1;
		p.codP:= -1;
		p.puntaje:= -1;
		while (l <> nil) do begin
			if (l^.dato.puntaje > max) then begin
				max:= l^.dato.puntaje;
				p:= l^.dato;
			end;
			l:= l^.sig;
		end;
	end;
	
	procedure buscarMaximos (var vM: vMaximos; vG: vGeneros);
	var
		i: integer;
		p: pelicula;
	begin
		for i:= 1 to 8 do begin
			retornarMaximoLista(vG[i], p);
			vM[i]:= p;
		end;
	end;
	
	/// INCISO C
	
	procedure ordenarVectorSeleccion (var v: vMaximos);
	var
		i,j,pos: integer;
		item: pelicula;
	begin
		for i:= 1 to 7 do begin
			pos:= i;
			for j:= i+1 to 8 do begin
				if (v[j].puntaje < v[pos].puntaje) then pos:= j;
			end;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
		end;
	end;
	
	/// INCISO D
	
	procedure imprimirMaximoYMinimo (v: vMaximos);
	begin
		writeln('El minimo puntaje obtenido es: ', v[1].codP);
		writeln('El maximo puntaje obtenido es: ', v[8].codP);
	end;
	
var
	vG: vGeneros;
	vM: vMaximos;
begin
	Randomize;
	inicializarVectorNil(vG);
	cargarVector(vG);
	buscarMaximos(vM, vG);
	ordenarVectorSeleccion(vM);
	imprimirMaximoYMinimo(vM);
end.

