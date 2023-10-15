import Structs
import BuddySystemFunc
import Foundation

/*
Simulador de manejador de memoria que hace uso del Buddy System.
El programa recibe como argumento el número de bloques de memoria
a manejar y posteriormente permite al usuario ir asignando los mismos
a nombres de su escogencia y liberar la memoria asociada a bloques ya 
asignados.

Autor: Santiago Finamore
*/

//Se extraen argumentos ingresados por la consola
let args = CommandLine.arguments
var vars: Set<Variable> = []

if args.count != 2 {
    print("Número equivocado de argumentos. Consultar uso del cliente y volver a ejecutar.")
    printClientUsage()
    exit(1)
}

//Se determina el número de bloques a manejar
let numBlockInput = Int(args[1])
if numBlockInput == nil {
    print("Tipo de argumento incorrecto. Consultar uso del cliente y volver a ejecutar.")
    printClientUsage()
    exit(1)
}

//Si el numero de bloques no es una potencia de 2 se usa la potencia de dos superior mas cercana
var numBlock = numBlockInput!
if !isPow2(n: numBlock) {
    numBlock = nearestPow2(n: numBlock)
    print("advertencia: número de bloques ingresado no es una potencia de 2. Utilizando BLOCK_NUM = \(numBlock)") 
}

//Inicio de ejecución del cliente
var command = ""
var exitFlag = 0
var table = blockRefTable(size: Int(log2(Double(numBlock))))

repeat {
    command = getCommand().lowercased() //Facilita parsear

    switch command {
        case let x where x.hasPrefix("reservar "):
            let varVals = parseReserveCommand(s: x)
            if varVals == nil {
                printResserveCmdErr()
                continue
            }

            let (name, size) = varVals!
            if vars.contains(Variable(n: name)) {
                printRepeatedVariableErr(name: name)
                continue
            }

            let newBlock = table.getBlock(size: size)
            if newBlock == nil {
                printNotEnoughMemoryErr()
                continue
            }

            let newVar = Variable(n: name)
            newVar.setBlock(b: newBlock!)
            vars.insert(newVar)
            printReservationSuccess(n: name, s: size)
        case let x where x.hasPrefix("liberar "):
            let varName = parseFreeCommand(s: x)
            if varName == nil {
                printFreeCmdErr()
                continue
            }
            if !vars.contains(Variable(n: varName!)) {
                printVarNotFoundErr(n: varName!)
                continue
            }
            let specificVar = vars.first(where: {$0.name == varName})!
            table.returnBlock(b: specificVar.getBlock()!)
            vars.remove(specificVar)
            printFreeSuccess(n: varName!)
        case "mostrar":
            table.printTableStatus()
        case "salir":
            exitFlag = 1
        case "help":
            printCommands()
        default:
            print("Comando no reconocido. Para ver comandos disponibles ingresar 'help'")
    }
} while exitFlag == 0