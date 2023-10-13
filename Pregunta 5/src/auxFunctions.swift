/*
Solicita al usuario la acción que desea realizar en el programa y retorna
el string raw del input ingresado. La validación del input se delega al 
procedimiento que lo reciba.

Returns:
 - s: String conteniendo el input ingresado por el usuario ante el prompt
*/
func getCommand() -> String {
    print("Ingrese la acción a realizar: ", terminator: "")
    let s = readLine(strippingNewline: true)
    return s!
}

/*
Recibe el string raw de la definicion de un programa y retorna el programa
resultante de la interpretacion del comando. En caso de que el comando no
haya sido ingresado correctamente (numero inadecuado de argumentos), retorna
nil.

Args:
 - s: String conteniendo el input raw del comando definicion de programa

Returns:
 - newProg: Objeto program que contiene el programa resultante de interpretar
   el comando s o nil.
*/
func parseProgramDefinition(s: String) -> program? {
    let commandArgs = s.split(separator: " ")
    if commandArgs.count != 3 { //El string tiene la forma 'programa <nombre> <lenguaje>'
        return nil
    } else {
        let newProg = program(n: String(commandArgs[1]), l: String(commandArgs[2]))
        return newProg
    }
}


/*
Recibe el string raw de la definicion de un traductor y retorna el traductor
resultante de la interpretacion del comando. En caso de que el comando no
haya sido ingresado correctamente (numero inadecuado de argumentos), retorna
nil.

Args:
 - s: String conteniendo el input raw del comando definicion de traductor

Returns:
 - newTrans: Objeto program que contiene el traductor resultante de interpretar
   el comando s o nil.
*/
func parseTranslatorDefinition(s: String) -> translator? {
    let commandArgs = s.split(separator: " ")
    //El string tiene la forma traductor <lenguaje_base> <lenguaje_origen> <lenguaje_destino>
    if commandArgs.count != 4 {
        return nil
    } else {
        let newTrans = translator(i: String(commandArgs[2]), o: String(commandArgs[3]), s: String(commandArgs[1]))
        return newTrans
    }
}

/*
Recibe el string raw de la definicion de un interprete y retorna el interprete
resultante de la interpretacion del comando. En caso de que el comando no
haya sido ingresado correctamente (numero inadecuado de argumentos), retorna
nil.

Args:
 - s: String conteniendo el input raw del comando definicion de interprete

Returns:
 - newInter: Objeto program que contiene el interprete resultante de interpretar
   el comando s o nil.
*/
func parseInterpreterDefinition(s: String) -> interpreter? {
    let commandArgs = s.split(separator: " ")
    //El string tiene la forma 'interprete <lenguaje_base> <lenguaje>'
    if commandArgs.count != 3 {
        return nil
    } else {
        let newInter = interpreter(i: String(commandArgs[2]), s: String(commandArgs[1]))
        return newInter
    }
}

/*
Funcion que recibe el string conteniendo el comando de verificacion de ejecutabilidad
ingresado por el usuario y retorna el struct program con nombre igual al ingresado por el
usuario. Si el programa ingresado no existe, o si el comando no fue ingresado correctamente.
se retorna nil.

Args:
 - s: String conteniendo el comando de verificacion de ejecutabilidad ingresado

Returns:
 - matchingProgram: struct program que contiene el programa de nombre ingresado por el usuario. 
*/
func parseExecutableCommand(s: String) -> program? {
    let commandArgs = s.split(separator:" ")
    //Se espera un string de la forma 'ejecutable <nombre>'
    if commandArgs.count != 2 || !programs.contains(where: {$0.name == commandArgs[1]}) {
        return nil
    } else {
        let matchingProgram = (programs.filter {$0.name == commandArgs[1]})[0]
        return matchingProgram
    }
}

/*
Se llama en el momento en que se determina en que el lenguaje l se vuelve ejecutable bajo
la maquina local. Se encarga de determinar qué lenguajes se vuelven ejecutables dada la 
ejecutabilidad de l.

Args:
 -l: Lenguaje que se determino como ejecutable al momento de invocacion
*/
func manageLanguageInsertion(l: String) {
    //Como ahora l es ejecutable, todos los lenguajes con traductores en l tambien lo son
    let intWrittenInInput = interpreters.filter {$0.source == l}
    for int in intWrittenInInput {
        canRun.insert(int.input)
    }

    //Si un traductor está escrito en l, y genera un lenguaje ejecutable, entonces el lenguaje de input tambien es ejecutable
    let transWrittenInInput = translators.filter {$0.source == l && canRun.contains($0.output)}
    for tr in transWrittenInInput {
        canRun.insert(tr.input)
    }

    //Si in traductor genera l, y está escrito en un lenguaje ejecutable, entonces su input también es ejecutable
    let transGeneratingInput = translators.filter {$0.output == l && canRun.contains($0.source)}
    for tr in transGeneratingInput {
        canRun.insert(tr.input)
    }
}

func manageInterprterInsertion(i: interpreter) {
    //Si el lenaguaje base se puede ejecutar en local
    if canRun.contains(i.source) {
        canRun.insert(i.input)      //Se agrega el input a lenguajes ejecutables
        manageLanguageInsertion(l: i.input)
    }
}

func manageTranslatorInsertion(t: translator) {
    //Si el lenaguaje base y el lenguaje output son ejecutables en local
    if canRun.contains(t.source) && canRun.contains(t.output) {
        canRun.insert(t.input)      //Entonces el input es ejecutable
        manageLanguageInsertion(l: t.input)

    }
}

/*
Imprime la bienvenida al programa
*/
func printWelcome() {
    print("Bienvenido al simulador de diagramas de T!")
    print("Puede empezar a utilizar el programa, o ingresar 'help' para mostrar las opciones disponibles")
}

/*
Imprimir manual de uso
*/
func printHelp() {
    print("Acciones principales diponibles")
    print(" i. DEFINIR <tipo> [<argumentos>]:")
    print("  Ingresar al programa un objeto de tipo <tipo> con características [<argumentos>]")
    print(" ii. EJECUTABLE <nombre>")
    print("  Determinar si el programa de nombre <nombre> es ejecutable bajo los objetos presentes")
    print(" iii. SALIR")
    print("  Culminar ejecución del programa")

    print("\nOpciones disponibles en acción DEFINIR")
    print(" - PROGRAMA <nombre> <lenguaje>:\n Registrar el programa llamado <nombre> escrito en <lenguaje>")
    print(" - INTERPRETE <lenguaje_base> <lenguaje>:\n Registrar un intérprete que entiende <lenguaje> escrito en <lenguaje_base>")
    print(" - TRADUCTOR <lenguaje_base> <lenguaje_origen> <lengauje_destino>:")
    print(" Registrar un traductor de <lenguaje_origen> a <lenguaje_destino> escrito en <lenguaje_base>")

}

/*
Imprime error de definicion de objeto
*/
func printDefError() {
    print("Definición no válida. Para ver formatos de definición, ejecutar 'help'")
}

/*
Error mostrando que ya existe un traductor igual a t en el conjunto translators

Args:
 - t: Traductor cuya existencia previa se confirmó
*/
func printRepeatedTranslatorError(t: translator) {
    print("Ya existe un traductor de \(t.input) a \(t.output) escrito en \(t.source)")
}

/*
Error mostrando que ya existe un interprete igual a i en el conjunto interpreters

Args:
 - i: Interprete cuya existencia previa se confirmó
*/
func printRepeatedInterpreterError(i: interpreter) {
    print("Ya existe un interprete para \(i.input) escrito en \(i.source)")
}

/*
Error mostrando que ya existe un programa con el mismo nombre que p

Args:
 - p: Programa cuya existencia previa se confirmó
*/
func printRepeatedProgramError(p: program) {
    print("Ya existe un programa de nombre \(p.name)")
}

func printExecCommandError() {
    print("El comando no fue ingresado correctamente o el programa ingresado no existe.")
}