/*
Struct representando un bloque de memoria

Members:
 - size: Tamaño del bloque
 - start: Dirección de inicio del bloque
 - end: Dirección de culminación del bloque
*/

public struct Block: Equatable {
    public var size: Int
    public var start: Int
    public var end: Int

    public init(si: Int, st: Int, e: Int) {
        self.size = si
        self.start = st
        self.end = e
    }

    public static func == (lb: Block, rb: Block) -> Bool {
        return lb.start == rb.start
    }
}