program Ejercicio3;
const

type
	rangoGeneros = 1..8;
	
	pelicula = record;
		codP: integer;
		codG: rangoGeneros;
		puntaje: real;
	end;
	
	lista = ^nodo
	
	nodo = record;
		dato: pelicula;
		sig: lista;
	end;
	
	vectorGeneros = array [rangoGeneros] of lista;
	

procedure inicializarVector(var v: vectorGeneros);
var i: integer;
begin
  for i := 1 to 8 do
    v[i] := nil;
end;
	
procedure leerPelicula (var p: pelicula);
begin
	writeln('Ingrese el codigo de la pelicula (-1 para finalizar): ')
	readln(p.codP);
	if (p.codP <> -1) then begin
		writeln('Ingrese el codigo del genero (1-8): ');
		readln(p.codG);
		writeln('Ingrese el puntaje promedio de las criticas: ');
		readln(p.puntaje);
	end;
end;
	
procedure agregarAtras(var l, ult: lista; p: pelicula);
var nue: lista;
begin
  new(nue);
  nue^.dato := p;
  nue^.sig := nil;
  if (l = nil) then
    l := nue
  else
    ult^.sig := nue;
  ult := nue;
end;

procedure cargarPeliculas (var l: lista, var v: vectorGeneros);
var
	p: pelicula;
begin
	leerPelicula (p);
	while (p.codP <> -1) do begin
		agregarAtras()
	end;





var
	
begin
	generarLista()
end;
	
