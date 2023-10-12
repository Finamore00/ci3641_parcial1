/*
Pequeño cliente para dar al usuario a escoger el programa a ejecutar y ejecutar bajo
los inputs de prueba.
*/

var programFlag = 0

func main() {
    print("Bienvenido al cliente de la pregunta 1.b")
    printProgramOptions()
    takeFunctionChoice()

    switch programFlag {
        case 1:
            rotateStringTest()
        case 2:
            matrixMultTest()
        default:
            return
    }
}

func printProgramOptions() {
    print("Indique qué función quiere ejecutar\n")
    print(" 1. Rotación de strings")
    print(" 2. Multiplicación de Matriz por su inversa")
}

func takeFunctionChoice() {
    print("Ingrese su elección [1, 2]: ", terminator: "")
    let s = readLine(strippingNewline: true)
    switch s! {
    case "1":
        print("Escogió rotación de strings")
        programFlag = 1
    case "2":
        print("Escogió Multiplicación de Matriz por su Inversa")
        programFlag = 2
    default:
        print("Por favor ingrese una de las opciones indicadas")
        takeFunctionChoice()
    }
    
}

func rotateStringTest() {
    print("Case 1: hola, 0")
    print(" Expected: hola, Result: \(StringRotate(w: "hola", k: 0))")
    print("Case 2: hola, 2")
    print(" Expected: laho, Result: \(StringRotate(w: "hola", k: 2))")
    print("Case 3: hola, 5")
    print(" Expected: olah, Result: \(StringRotate(w: "hola", k: 5))")
    print("Case 4: '', 0")
    print(" Expected: '', Result: \(StringRotate(w: "", k: 0))")
    print("Case 5: '', 80")
    print(" Expected: '', Result: \(StringRotate(w: "", k: 80))")
    print("Case 6: 🎉1234, 3")
    print(" Expected: 34🎉12, Result: \(StringRotate(w: "🎉1234", k: 3))")
}

func matrixMultTest() {
    print("Hello, world")
}

main()