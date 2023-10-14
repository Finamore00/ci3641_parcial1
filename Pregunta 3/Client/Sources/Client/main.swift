import Block
import BuddySystemFunc

/*
Simulador de manejador de memoria que hace uso del Buddy System.
El programa recibe como argumento el número de bloques de memoria
a manejar y posteriormente permite al usuario ir asignando los mismos
a nombres de su escogencia y liberar la memoria asociada a bloques ya 
asignados.

Autor: Santiago Finamore
*/

let args = CommandLine.arguments

if args.count != 1 {
    print("Argumento ingresado incorrecto. Por favor ingrese un argumento válido")
    printClientUsage()
}