*CONSULTAS GENERALES*

- Gonza en el ultimo video habla de recorrer una matriz o cargar una matriz de forma secuencial usando DIV y MOD (recordamos
que era una manera sencilla para hacerlo). Como se hace?

Fila = cantCargados MOD cantFilas
Columna = cantCargados DIV cantColumnas

ej: 
  while (dni <> -1) {
    col = (cantCargados MOD cantColumnas)
    fil = (cantCargados DIV cantFilas)
    matriz [col][fil] = dni;
  }

*CONSULTAS INCISOS*

Ejercicio 3:
Paso 7 - Cual es la manera correcta de hacer el inciso? (Tengo que decir en todas las pos donde se encontro (se puede repetir))


