/*
Programa principal para Pregunta 5. 

Autor: Santiago Finamore - 1810125
*/

/*
Declaracion de variables
*/
var canRun: Set<String> = ["local"]
var interpreters: Set<interpreter> = []
var translators: Set<translator> = []
var programs: Set<program> = []
var command = ""
var exitFlag = 0

//Se da bienvenida al usuario
printWelcome()


//Obtener comando y realizar accion acorde hasta que se ingrese SALIR
repeat {
    command = getCommand().lowercased() //Hace comparar más fácil
    
    switch command {
        case "help":
            printHelp()
        case let x where x.hasPrefix("definir "):
            //Se verifica qué se quiere definir
            let def = command.suffix(command.count - "definir ".count)
            switch def {
                case let y where y.hasPrefix("programa "):
                    let newProg = parseProgramDefinition(s: String(y))
                    if newProg == nil {
                        printDefError()
                    } else {
                        if programs.contains(newProg!) {
                            printRepeatedProgramError(p: newProg!)
                        } else {
                            programs.insert(newProg!)
                            print("Se definió el programa '\(newProg!.name)' ejecutable en '\(newProg!.language)'")
                        }
                    }
                case let y where y.hasPrefix("traductor "):
                    let newTrans = parseTranslatorDefinition(s: String(y))
                    if newTrans == nil {
                        printDefError()
                    } else {
                        if translators.contains(newTrans!) {
                            printRepeatedTranslatorError(t: newTrans!)
                        } else {
                            translators.insert(newTrans!)
                            manageTranslatorInsertion(t: newTrans!)
                            print("Se definió un traductor de '\(newTrans!.input)' a '\(newTrans!.output)' escrito en '\(newTrans!.source)'")
                        }

                    }
                case let y where y.hasPrefix("interprete "):
                    let newInter = parseInterpreterDefinition(s: String(y))
                    if newInter == nil {
                        printDefError()
                    } else {
                        if interpreters.contains(newInter!) {
                            printRepeatedInterpreterError(i: newInter!)
                        } else {
                            interpreters.insert(newInter!)
                            manageInterprterInsertion(i: newInter!)
                            print("Se definió un intérprete para '\(newInter!.input)' escrito en '\(newInter!.source)'")
                        }
                    }
                default:
                    printDefError()
            }
        case let x where x.hasPrefix("ejecutable "):
            let pr = parseExecutableCommand(s: command)
            if pr == nil {
                printExecCommandError()
            } else {
                if canRun.contains(pr!.language) {
                    print("Si, es posible ejecutar el programa '\(pr!.name)'")
                } else {
                    print("No es posible ejecutar el programa '\(pr!.name)'")
                }
            }
        case "salir":
            exitFlag = 1
        default:
            print("Comando inválido. Lista de comandos disponible ingresando 'help'")
    }
} while (exitFlag == 0)