program gork;
type
    ventas = record
        cod :integer;
        fecha:integer;
        cant:integer;
    end;

ventaSinFecha = record
        codP:integer;
        cantidad:integer;
    end;

arbol = ^nodo;
nodo = record
    dato: ventas;
    HI:arbol;
    HD:arbol;
end;
{EMPIEZA A}
procedure leerVenta(var v:ventas);
begin
    writeln('Ingrese el codigo: ');
    readln(v.cod);
        if (v.cod <> 0) then begin
            writeln('Ingrese fecha: ');
            readln(v.fecha);
            writeln('Ingrese cantidad: ');
            readln(v.cant);
        end;
end;

procedure agregarUno(var a1:arbol;v:ventas);
begin
    if (a1 = nil) then begin
        new(a1);
        a1^.dato:=v;
        a1^.HI:= nil;
        a1^.HD := nil;
    end
    else begin
        if (v.cod < a1^.dato.cod) then agregarUno(a1^.HI,v)
        else agregarUno(a1^.Hd,v);
end;

procedure arbolUno(var a1:arbol;v:ventas);
begin
    leerVenta(v);
    while (v.cod <> 0) do begin
        agregar(a1,v);
        leerVenta(v);
    end;
end;
{TERMINA A}
{EMPIEZA B}
procedure leerVentaSinFecha(var v:ventaSinFecha);
begin
    writeln('Ingrese el codigo: ');
    readln(v.codP);
        if (v.codP <> 0) then begin
            writeln('Ingrese cantidad: ');
            readln(v.cantidad);
end;

procedure agregarDos(var a2:arbol;v:ventaSinFecha)
begin
    if (a2 = nil) then begin
        new(a2);
        a2^.dato:=v;
        a2^.HI:= nil;
        a2^.HD := nil;
    end
    else begin
        if (v.cod < a2^.dato.codP) then agregarDos(a2^.HI,v)
        else agregarDos(a2^.Hd,v);
end;

procedure arbolDos(var a2:arbol;v:ventaSinFecha);
begin
    leerVentaSinFecha(v);
    while (v.codP <> 0) do begin
        agregarDos(a2,v);
        leerVentaSinFecha(v);
    end;
end;
{TERMINA B}
{EMPIEZA C}

{TERMINA C}









var
    v:ventas;
    a1,a2:arbol;
begin
    arbolUno(a1,v);
    arbolDos(a2,v);
end.
