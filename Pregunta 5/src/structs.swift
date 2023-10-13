/*
Definicion de estructuras de datos compuestas requeridas para la implementacion del
programa solicitado.

Estructuras definidas
 - program
 - translator
 - interpreter

Todas las estructuras son declaradas como hasheables y equiparables, de manera que se
puedan usar con conjuntos (Set). Se considera que dos instancias de cualquiera de las
estructuras son iguales si todos sus atributos son iguales.

Autor: Santiago Finamore
*/


/*
Estructura que representa un programa. 

Propiedades:
 - name: Nombre del programa
 - language: Lenguaje de implementacion del programa

Ninguna de las propiedades es modificable
*/
struct program: Hashable {
    let name: String;
    let language: String;

    init(n: String, l: String) {
        name = n
        language = l
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lp: program, rp: program) -> Bool {
        return lp.name == rp.name
    }
}

/*
Estructura que representa un traductor bajo la nocion de los diagramas de T.

Propiedades:
 - input: Lenguaje de implementacion del programa de entrada
 - output: Lenguaje al que seria traducido el programa ingresado.
 - source: Lenguaje de implementacion del traductor

Ninguna de las propiedades es modificable
*/
struct translator: Hashable {
    let input: String;
    let output: String;
    let source: String;

    init(i: String, o: String, s: String) {
        input = i
        output = o
        source = s
    }

    //Necesario para utilizacion en conjuntos
    func hash(into hasher: inout Hasher) {
        hasher.combine(input)
        hasher.combine(output)
        hasher.combine(source)
    }

    //Necesario para uso de struct como equiparable
    static func == (lt: translator, rt: translator) -> Bool {
        return lt.input == rt.input && lt.output == rt.output && lt.source == rt.source
    }
}


/*
Estructura que representa un interpretador bajo la interpretacion de los diagramas de T.

Propiedades:
 - input: Lenguaje a interpretar
 - source: Lenguaje de implementacion del interpretador

Ninguna de las propiedades es modificable
*/
struct interpreter: Hashable {
    let input: String;
    let source: String;

    init(i: String, s: String) {
        input = i
        source = s
    }

    //Necesario para utilizacion en conjuntos
    func hasher(into hasher: inout Hasher) {
        hasher.combine(input)
        hasher.combine(source)
    }

    //Necesario para uso de struct como equiparable
    static func == (li: interpreter, ri: interpreter) -> Bool {
        return li.input == ri.input && li.source == ri.source
    }
}