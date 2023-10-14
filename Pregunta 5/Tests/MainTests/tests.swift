@testable import Main
import XCTest

class Pregunta5Tests: XCTestCase {

    //Comprobar funcionamiento de func == entre structs creados
    func testStructEquality() {
        XCTAssertEqual(interpreter(i: "Java", s: "C"), interpreter(i: "Java", s: "C"))
        XCTAssertNotEqual(interpreter(i: "Java", s: "C"), interpreter(i: "Python", s: "C"))
        XCTAssertEqual(translator(i: "C", o: "Python3", s: "LOCAL"), translator(i: "C", o: "Python3", s: "LOCAL"))
        XCTAssertNotEqual(translator(i: "C", o: "paitontre", s: "LOCAL"), translator(i: "C", o: "Python3", s: "LOCAL"))
        XCTAssertEqual(program(n: "fibonacci", l: "LOCAL"), program(n: "fibonacci", l:"LOCAL"))
        XCTAssertNotEqual(program(n: "fibonacci", l: "LOCAL"), program(n: "Fibonacci", l:"LOCAL"))
    }

    //Comprobar correcto funcionamiento de agregar a conjuntos
    func testSetWorkings() {
        var i: Set<interpreter> = []
        var t: Set<translator> = []
        var p: Set<program> = []

        //Probar que no se pueda tener elementos repetidos
        i.insert(interpreter(i: "Java", s: "Pascal"))
        i.insert(interpreter(i: "Java", s: "Pascal"))
        XCTAssert(i.count == 1)
        i.insert(interpreter(i: "Pascal", s: "LOCAL"))
        i.insert(interpreter(i: "C", s: "LOCAL"))
        XCTAssert(i.count == 3)

        //Repitiendo con set de programas y de traductores
        p.insert(program(n: "fibonacci", l: "Rust"))
        p.insert(program(n: "fibonacci", l: "Rust"))
        XCTAssert(p.count == 1)
        p.insert(program(n: "fibonacci", l: "C"))
        XCTAssert(p.count == 1)
        p.insert(program(n: "factorial", l: "Golang"))
        XCTAssert(p.count == 2)

        t.insert(translator(i: "Rust", o: "LOCAL", s: "LOCAL"))
        t.insert(translator(i: "Rust", o: "LOCAL", s: "LOCAL"))
        XCTAssert(t.count == 1)
        t.insert(translator(i: "C", o: "Dreamberd", s: "JavaScript"))
        XCTAssert(t.count == 2)
        
    }


    static var allTests = [
        ("testStructEquality", testStructEquality),
        ("testSetWorkings", testSetWorkings)
    ]
}