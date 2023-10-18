import Structs
import Foundation

/*
Funciones auxiliares al cliente para el programa de manejo
de memoria Buddy System.
*/


/*
Imprime la sintaxis requerida para invocar al cliente
*/
public func printClientUsage() {
    print("MODO DE USO: ./cliente <BLOCK_NUM>")
    print("    BLOCK_NUM: Número de bloques de memoria a manejar dentro del sistema")
}

/*
Indica si un entero es una potencia de 2.

Args:
 - n: Número entero que se determinará si es una potencia de 2
*/
public func isPow2(n: Int) -> Bool {
    return floor(log2(Double(n))) == log2(Double(n))
}


/*
Función que recibe un entero n y retorna un entero igual a la potencia de
2 más cercana y mayor o igual a n.

Args:
 - n: Número cuya potencia de 2 más cercana y mayor o igual será retornada.
*/
public func nearestPow2(n: Int) -> Int {
    return isPow2(n: n) ? n : Int(pow(2, floor(log2(Double(n))) + 1))
}

/*
Función que solicita input del usuario (bajo el caso de uso esperado, un comando)
y retorna el string que contiene el input ingresado por consola.

Returns:
 - s: String conteniendo el input ingresado por el usuario al prompt.
*/
public func getCommand() -> String {
    print("Ingrese acción a realizar: ", terminator: "")
    let s = readLine(strippingNewline: true)
    return s!
}


/*
Función que recibe un string con el comando de reserva de memoria ingresado por el
usuario y retorna el nombre de la variable a reservar y la cantidad de bloques 
solicitados. Si el formato del comando es incorrecto o si los argumentos no son
de tipo adecuado retorna nil.

Args:
 - s: String conteniendo el comando de reserva de memoria ingresado por el usuario

Returns:
 - Tupla conteniendo el nombre de la variable a reservar y el número de bloques que 
 se están solicitando para la misma
*/
public func parseReserveCommand(s: String) -> (String, Int)? {
    let strWords = s.split(separator: " ")

    if strWords.count != 3 {
        return nil
    } else {
        let name = String(strWords[1])
        let size = Int(strWords[2])

        return size == nil ? nil : (name, nearestPow2(n: size!))
    }
}

/*
Función que recibe un string conteniendo el comando de liberación ingresado por
el usuario y retorna el nombre de la variable a liberar. Si el formato del comando
no es correcto retorna nil.

Args:
 - s: String conteniendo el comando de liberación ingresado por el usuario

Returns:
 - String conteniendo el nombre de la variable a liberar.
*/
public func parseFreeCommand(s: String) -> String? {
    let cmdWords = s.split(separator: " ")
    if cmdWords.count != 2 {
        return nil
    }
    return String(cmdWords[1])
}


//Impresión de mensajes varios.
public func printResserveCmdErr() {
    print("Error de sintaxis en reserva. Puede consultar argumentos para comando reservar mediante comando 'help'")
}

public func printFreeCmdErr() {
    print("Error de sintaxis en liberación. Puede consultar argumentos para comando liberar mediante comando 'help'")
}

public func printNotEnoughMemoryErr() {
    print("No hay bloques de memoria disponibles que puedan satisfacer la solicitud ingresada.")
}

public func printRepeatedVariableErr(name: String) {
    print("Ya fue declarada una variable de nombre \(name). Si desea volver a declarar esta variable libérela y luego vuelva a intentar")
}

public func printVarNotFoundErr(n: String) {
    print("No hay variable registrada bajo el nombre \(n)")
}

public func printReservationSuccess(n: String, s: Int) {
    print("Se reservaron \(s) bloques bajo el nombre \(n)")
}

public func printFreeSuccess(n: String) {
    print("Se liberó la variable \(n)")
}

public func printWelcome() {
    print("Bienvenido al administrador de memoria BuddySystem!")
    print(" Para ver comandos diponibles ingresar 'help'")
}

public func printCommands() {
    print("COMANDOS DISPONIBLES:")
    print(" i. RESERVAR <cantidad> <nombre> : Reserva <cantidad> bloques y los pone bajo ocupación de <nombre>")
    print(" ii. LIBERAR <nombre> : Libera el espacio ocupado por la variable de nombre <nombre>")
    print(" iii. MOSTRAR : Muestra por consola el estado actual de las listas de bloques y de las variables reservadas.")
    print(" iv. SALIR : Culminar ejecución del simulador")
    print(" v. help: Mostrar ayuda")
}